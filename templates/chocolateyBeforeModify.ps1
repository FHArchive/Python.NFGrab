$ErrorActionPreference = 'Stop'

{{#fontList}}
Uninstall-ChocolateyFont "{{fileName}}"
{{/fontList}}
