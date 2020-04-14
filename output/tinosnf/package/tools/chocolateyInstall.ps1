$ErrorActionPreference = 'Stop'
$packageName = 'tinosnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\tinosNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\TinosNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\TinosNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\TinosNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\TinosNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
