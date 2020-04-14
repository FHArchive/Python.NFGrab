$ErrorActionPreference = 'Stop'
$packageName = 'proggycleannf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\proggyCleanNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs


Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
