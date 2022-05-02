"""Iterate through each font and generate a package for each.
"""
import hashlib
import json
import os
import re
import shutil
import warnings
import zipfile

import pystache
from metprint import Logger, LogType


def doAddOneToZip(zipFile, fileCandidate, fontFilesTree, fontType, data):
	"""Add the font file to the zip file."""
	fontFile = fontFilesTree + "/complete/" + fileCandidate
	fontName, fontSum = getNameAndCheckSum(fontFile, data["fontFamily"], fontType,
	".otf" in fileCandidate)
	data["fontList"].append({"fileName": fontName, "sha256": fontSum})
	with warnings.catch_warnings():
		warnings.simplefilter("error")
		try:
			zipFile.write(fontFile, "/otf/" + fontName)
		except UserWarning as warning:
			# Close the zip file and forward the warning
			zipFile.close()
			raise warning
	return data


def addOneToZip(zipFile, fileCandidates, fontFilesTree, fontType, data):
	"""Iterate through a list of candidates and add the correct file to the zip."""
	for fileCandidate in fileCandidates:
		if "Nerd Font Complete Windows Compatible.otf" in fileCandidate:
			return doAddOneToZip(zipFile, fileCandidate, fontFilesTree, fontType, data)
	for fileCandidate in fileCandidates:
		if "Nerd Font Complete Windows Compatible.ttf" in fileCandidate:
			return doAddOneToZip(zipFile, fileCandidate, fontFilesTree, fontType, data)
	return data


def copyFontFiles(data):
	"""Copy the font files."""
	fontFilesTree = data["file"]["patched"] + "/" + data["fontFamilyBase"]
	zipFile = zipfile.ZipFile(
	data["outputBase"] + "/package/tools/" + data["fontFamilyCamel"] + ".zip", "w")
	data["fontList"] = []
	if "complete" in os.listdir(fontFilesTree):
		data = addOneToZip(zipFile,
		os.listdir(fontFilesTree + "/complete"),
		fontFilesTree,
		"Regular",
		data)
	for fontType in os.listdir(fontFilesTree):
		if os.path.isdir(fontFilesTree + "/" + fontType + "/complete"):
			data = addOneToZip(zipFile,
			os.listdir(fontFilesTree + "/" + fontType + "/complete"),
			fontFilesTree + "/" + fontType,
			fontType,
			data)
	zipFile.close()
	if len(data["fontList"]) == 0:
		raise UserWarning
	# Get the zip file hash
	data["sha256Zip"] = hashlib.sha256(
	open(data["outputBase"] + "/package/tools/" + data["fontFamilyCamel"] + ".zip",
	"rb").read()).hexdigest()
	return data


def getNameAndCheckSum(fontFile, fontFamily, fontType, otf=True):
	"""Copy a font file from the nerdfont tree to the choco tree."""
	fontFileName = fontFamily + "-" + fontType + (".otf" if otf else ".ttf")
	fontFileSum = hashlib.sha256(open(fontFile, "rb").read()).hexdigest()
	return fontFileName, fontFileSum


def populate(template, data):
	"""Do mustache on the file."""
	return pystache.render(template, data)


def doFontFamily(data):
	"""For each font family, do a series of jobs such as copying files and...

	generating the nuspec file.
	"""
	# Add to data
	data["fontFamily"] = data["fontFamilyBase"] + "NF"
	data["fontFamilyLower"] = data["fontFamily"].lower()
	data["fontFamilyCamel"] = data["fontFamily"][0].lower() + data["fontFamily"][1:]
	data["outputBase"] = "output/" + data["fontFamilyLower"]
	data["url"]["patched"] = pystache.render(data["url"]["patched"], data)
	data["url"]["unpatched"] = pystache.render(data["url"]["unpatched"], data)

	# grab license from unpatched
	lice = False
	for licenseCandidate in os.listdir(data["file"]["unpatched"] + "/"
	+ data["fontFamilyBase"]):
		if "license" in licenseCandidate.lower(
		) or "licence" in licenseCandidate.lower():
			data["licenseUrl"] = data["url"]["unpatched"] + "/" + data[
			"fontFamilyBase"] + "/" + licenseCandidate
			lice = open(
			data["file"]["unpatched"] + "/" + data["fontFamilyBase"] + "/"
			+ licenseCandidate,
			"rb").read().decode("utf-8", "replace")
	if not lice:
		# if we can't find the license abort mission!
		return False
	# regex author "^Copyright.*\d{4}[ ,](.*)"
	try:
		author = re.findall(r"^Copyright.*\d{4}[ ,](.*)", lice)[0].strip()
	except IndexError:
		author = "[unknown author]"
	# grab readme
	data["projectUrl"] = data["url"]["patched"] + "/" + data["fontFamilyBase"]
	if os.path.isfile(data["fontFamilyBaseFile"] + "/readme.md"):
		data["docsUrl"] = data["projectUrl"] + "/readme.md"
		readme = open(data["fontFamilyBaseFile"] + "/readme.md",
		"rb").read().decode("utf-8", "replace")
	else:
		data["docsUrl"] = data["projectUrl"] + "/font-info.md"
		readme = open(data["fontFamilyBaseFile"] + "/font-info.md",
		"rb").read().decode("utf-8", "replace")
	readme = "# " + data["fontFamily"] + "\n\n" + open("templates/description.md",
	"r").read() + "\n" + readme

	os.makedirs(data["outputBase"] + "/package/tools", exist_ok=True)
	# grab the font files
	try:
		data = copyFontFiles(data)
	except UserWarning:
		shutil.rmtree("output/" + data["fontFamilyLower"], ignore_errors=False)
		return False

	# add more to data
	data["author"] = author
	data["description"] = readme[:3000] + "\n\n..." if len(readme) > 3000 else readme
	data["summary"] = "\n\n".join(data["description"].split("\n\n")[:2]).strip()

	# write license and readme
	open(data["outputBase"] + "/package/tools/LICENSE.txt",
	"wb").write(lice.encode("utf-8", "replace"))
	open(data["outputBase"] + "/LICENSE.md",
	"wb").write(lice.encode("utf-8", "replace"))
	open(data["outputBase"] + "/README.md",
	"wb").write(readme.encode("utf-8", "replace"))

	# populate verification
	verif = populate(open("templates/VERIFICATION.txt").read(), data)
	open(data["outputBase"] + "/package/tools/VERIFICATION.txt", "w").write(verif)

	# populate install
	install = populate(open("templates/chocolateyInstall.ps1").read(), data)
	open(data["outputBase"] + "/package/tools/chocolateyInstall.ps1",
	"w").write(install)

	# populate uninstall
	uninstall = populate(open("templates/chocolateyBeforeModify.ps1").read(), data)
	open(data["outputBase"] + "/package/tools/chocolateyBeforeModify.ps1",
	"w").write(uninstall)

	# populate .nuspec
	nuspec = populate(
	open("templates/{{fontFamilyLower}}.nuspec",
	"rb").read().decode("utf-8", "replace"),
	data)
	open(data["outputBase"] + "/package/" + data["fontFamilyLower"] + ".nuspec",
	"wb").write(nuspec.encode("utf-8", "replace"))

	return True


def doNfgrab():
	"""Grab json data from the config file. Iterate through each font and...

	generate a package for each.
	"""
	data = json.loads(open("templates/paths.json", "r").read())
	for data["fontFamilyBase"] in os.listdir(data["file"]["patched"]):
		data[
		"fontFamilyBaseFile"] = data["file"]["patched"] + "/" + data["fontFamilyBase"]
		if os.path.isdir(data["fontFamilyBaseFile"]):
			printf = Logger()
			printf.logPrint(data["fontFamilyBase"],
			LogType.SUCCESS if doFontFamily(data) else LogType.ERROR)


if __name__ == "__main__":
	doNfgrab()
