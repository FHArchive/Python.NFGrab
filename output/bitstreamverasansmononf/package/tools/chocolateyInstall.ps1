$ErrorActionPreference = 'Stop'
$packageName = 'bitstreamverasansmononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\bitstreamVeraSansMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\BitstreamVeraSansMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\BitstreamVeraSansMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\BitstreamVeraSansMonoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\BitstreamVeraSansMonoNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
