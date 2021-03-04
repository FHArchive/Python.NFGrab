$ErrorActionPreference = 'Stop'
$packageName = 'cascadiacodenf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\cascadiaCodeNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-ExtraLight.otf"
Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-Light.otf"
Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-Regular.otf"
Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-SemiBold.otf"
Install-ChocolateyFont "$toolsDir\otf\CascadiaCodeNF-SemiLight.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
