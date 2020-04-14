$ErrorActionPreference = 'Stop'
$packageName = 'firamononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\firaMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\FiraMonoNF-Bold.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraMonoNF-Medium.otf"
Install-ChocolateyFont "$toolsDir\otf\FiraMonoNF-Regular.otf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
