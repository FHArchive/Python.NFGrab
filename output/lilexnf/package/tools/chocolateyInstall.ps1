$ErrorActionPreference = 'Stop'
$packageName = 'lilexnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\lilexNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\LilexNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\LilexNF-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\LilexNF-Medium.otf"
Install-ChocolateyFont "$toolsDir\otf\LilexNF-Regular.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
