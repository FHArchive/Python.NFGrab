$ErrorActionPreference = 'Stop'
$packageName = 'hacknf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\hackNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\HackNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\HackNF-BoldItalic.ttf"
Install-ChocolateyFont "$toolsDir\otf\HackNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\HackNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
