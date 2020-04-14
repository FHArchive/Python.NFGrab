$ErrorActionPreference = 'Stop'
$packageName = 'ubuntunf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\ubuntuNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Condensed.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuNF-Regular-Italic.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
