$ErrorActionPreference = 'Stop'
$packageName = 'ubuntumononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\ubuntuMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\UbuntuMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuMonoNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\UbuntuMonoNF-Regular-Italic.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
