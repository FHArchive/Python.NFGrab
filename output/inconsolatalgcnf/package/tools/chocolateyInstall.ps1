$ErrorActionPreference = 'Stop'
$packageName = 'inconsolatalgcnf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\inconsolataLGCNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\InconsolataLGCNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\InconsolataLGCNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\InconsolataLGCNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\InconsolataLGCNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
