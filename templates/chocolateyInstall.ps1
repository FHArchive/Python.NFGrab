$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\{{fontFamilyCamel}}.zip"

Get-ChocolateyUnzip -FileFullPath $url -Destination $toolsDir

{{ #fontList}}
Install-ChocolateyFont "$toolsDir\otf\{{fileName}}"
{{ /fontList }}

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
