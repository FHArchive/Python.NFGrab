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

Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Medium.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Regular.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraCodeNF-Retina.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
