$ErrorActionPreference = 'Stop'
$packageName = 'firacodenf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\firaCodeNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Retina.ttf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-SemiBold.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
