$ErrorActionPreference = 'Stop'

{{#fontList}}
Uninstall-ChocolateyFont "$toolsDir\otf\{{fileName}}"
{{/fontList}}
