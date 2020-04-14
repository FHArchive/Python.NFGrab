$ErrorActionPreference = 'Stop'
$packageName = 'notonf'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "$toolsDir\notoNF.zip"

$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $toolsDir
	fileType      = 'ZIP'
	url           = $url
}

Install-ChocolateyZIPPackage @packageArgs

Install-ChocolateyFont "$toolsDir\otf\NotoNF-Emoji.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Mono.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Sans.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Sans-Display.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Sans-Mono.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Serif.ttf"
Install-ChocolateyFont "$toolsDir\otf\NotoNF-Serif-Display.ttf"

Remove-Item "$toolsDir\otf" -Recurse -ErrorAction SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue | Out-Null
