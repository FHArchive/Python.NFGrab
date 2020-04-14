$ErrorActionPreference = 'Stop'
$packageName = '3270nf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\3270NF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\3270NF-Medium.otf"
Install-ChocolateyFont "$toolsDir\otf\3270NF-Narrow.otf"
Install-ChocolateyFont "$toolsDir\otf\3270NF-Semi-Narrow.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
