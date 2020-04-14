$ErrorActionPreference = 'Stop'
$packageName = 'victormononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\victorMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Bold-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Extra-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Extra-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Extra-Light-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Light.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Light-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Light-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Medium-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Semi-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Semi-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Semi-Bold-Oblique.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Thin.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Thin-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\VictorMonoNF-Thin-Oblique.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
