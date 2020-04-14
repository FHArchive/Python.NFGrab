$ErrorActionPreference = 'Stop'
$packageName = 'cousinenf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\cousineNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\CousineNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\CousineNF-BoldItalic.ttf"
Install-ChocolateyFont "$toolsDir\otf\CousineNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\CousineNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
