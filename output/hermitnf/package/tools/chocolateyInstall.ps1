$ErrorActionPreference = 'Stop'
$packageName = 'hermitnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\hermitNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\HermitNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\HermitNF-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\HermitNF-Medium.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
