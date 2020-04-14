$ErrorActionPreference = 'Stop'
$packageName = 'monoidnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\monoidNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\MonoidNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\MonoidNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\MonoidNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\MonoidNF-Retina.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
