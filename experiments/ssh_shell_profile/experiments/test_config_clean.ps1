# This works for sure... might want to be a bit smarter
# i think i need shortcuts for executing functions or something
# it's way hard to organize compared to nodejs
$snippet = @'
"# If Interactive, set prompt to show ssh connection and current directory. ensure no single quotes\nif ($null -ne $Host.UI) {\n\n  function prompt{\n    $cwd = $executionContext.SessionState.Path.CurrentLocation\n    $ssh = \"\"\n    \n    if ($env:SSH_CONNECTION) {\n        $ssh = \"ssh://\"\n    }\n    Write-Host \"# $ssh$Env:Username@$env:COMPUTERNAME\" -ForegroundColor DarkGray\n    Write-Host \"# $cwd\" -ForegroundColor DarkGray\n    Write-Host \"PS >\" -ForegroundColor DarkGreen -NoNewline\n    Write-Host $(\">\" * ($nestedPromptLevel)) -ForegroundColor DarkGray -NoNewline\n    return \" \"\n  }\n\n}\n"
'@
$filedir = $PSScriptRoot
$jsonString = $snippet | ConvertFrom-Json
$jsonString | set-content -Path $filedir\"profile_config.tmp.ps1" -Encoding utf8
