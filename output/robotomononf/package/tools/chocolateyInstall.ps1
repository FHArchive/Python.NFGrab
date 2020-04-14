$ErrorActionPreference = 'Stop'
$packageName = 'robotomononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\robotoMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Thin.ttf"
Install-ChocolateyFont "$toolsDir\otf\RobotoMonoNF-Thin-Italic.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
