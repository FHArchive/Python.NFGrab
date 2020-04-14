$ErrorActionPreference = 'Stop'
$packageName = 'iosevkanf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\iosevkaNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Bold-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Extra-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Extra-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Extra-Light-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Heavy.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Heavy-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Heavy-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Light-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Medium-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Thin.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Thin-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\IosevkaNF-Thin-Oblique.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
