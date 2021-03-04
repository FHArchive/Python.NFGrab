$ErrorActionPreference = 'Stop'
$packageName = 'opendyslexicnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\openDyslexicNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Alta-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Alta-Bold-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Alta-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Alta-Regular.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Bold-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Mono-Regular.otf"
Install-ChocolateyFont "$toolsDir\otf\OpenDyslexicNF-Regular.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
