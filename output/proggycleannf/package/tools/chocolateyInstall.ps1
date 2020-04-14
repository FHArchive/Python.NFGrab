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

Install-ChocolateyFont "$toolsDir\otf\ProggyCleanNF-Latin2.ttf"
Install-ChocolateyFont "$toolsDir\otf\ProggyCleanNF-Regular.ttf"
Install-ChocolateyFont "$toolsDir\otf\ProggyCleanNF-SlashedZero.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
