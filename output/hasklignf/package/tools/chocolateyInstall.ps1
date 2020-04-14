$ErrorActionPreference = 'Stop'
$packageName = 'hasklignf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\haskligNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Black.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Black-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Bold-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Extra-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Extra-Light-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Light-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Medium.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Medium-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Regular.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Semibold.otf"
Install-ChocolateyFont "$toolsDir\otf\HaskligNF-Semibold-Italic.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
