$ErrorActionPreference = 'Stop'
$packageName = 'jetbrainsmononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\jetBrainsMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-ExtraBold.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-ExtraBold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Medium.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Medium-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\JetBrainsMonoNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
