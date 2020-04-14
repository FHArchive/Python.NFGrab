$ErrorActionPreference = 'Stop'
$packageName = 'gohunf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\gohuNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\GohuNF-11.ttf"
Install-ChocolateyFont "$toolsDir\otf\GohuNF-14.ttf"
Install-ChocolateyFont "$toolsDir\otf\GohuNF-uni-11.ttf"
Install-ChocolateyFont "$toolsDir\otf\GohuNF-uni-14.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
