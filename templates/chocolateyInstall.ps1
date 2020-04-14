$ErrorActionPreference = 'Stop'
$packageName = '{{fontFamilyLower}}'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\{{fontFamilyCamel}}.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

{{ #fontList}}
Install-ChocolateyFont "$toolsDir\otf\{{fileName}}"
{{ /fontList }}

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
