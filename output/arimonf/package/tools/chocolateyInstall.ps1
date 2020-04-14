$ErrorActionPreference = 'Stop'
$packageName = 'arimonf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\arimoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\ArimoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\ArimoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\ArimoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\ArimoNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
