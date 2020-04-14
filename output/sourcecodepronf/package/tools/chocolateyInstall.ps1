$ErrorActionPreference = 'Stop'
$packageName = 'sourcecodepronf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\sourceCodeProNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Black.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Black-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Extra-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-ExtraLight-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Semibold.ttf"
Install-ChocolateyFont "$toolsDir\otf\SourceCodeProNF-Semibold-Italic.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
