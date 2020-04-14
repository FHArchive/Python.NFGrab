$ErrorActionPreference = 'Stop'
$packageName = 'monofurnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\monofurNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\MonofurNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\MonofurNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\MonofurNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
