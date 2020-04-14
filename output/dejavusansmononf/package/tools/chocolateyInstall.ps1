$ErrorActionPreference = 'Stop'
$packageName = 'dejavusansmononf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\dejaVuSansMonoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\DejaVuSansMonoNF-Bold.ttf"
Install-ChocolateyFont "$toolsDir\otf\DejaVuSansMonoNF-Bold-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\DejaVuSansMonoNF-Italic.ttf"
Install-ChocolateyFont "$toolsDir\otf\DejaVuSansMonoNF-Regular.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
