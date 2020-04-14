$ErrorActionPreference = 'Stop'
$packageName = 'mplusnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\mPlusNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Black.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Heavy.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\MPlusNF-Thin.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
