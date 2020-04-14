$ErrorActionPreference = 'Stop'
$packageName = 'mononokinf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\mononokiNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\MononokiNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\MononokiNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\MononokiNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\MononokiNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
