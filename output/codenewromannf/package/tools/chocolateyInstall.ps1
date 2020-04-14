$ErrorActionPreference = 'Stop'
$packageName = 'codenewromannf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\codeNewRomanNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\CodeNewRomanNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\CodeNewRomanNF-Italic.otf"
Install-ChocolateyFont "$toolsDir\otf\CodeNewRomanNF-Regular.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
