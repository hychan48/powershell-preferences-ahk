# maybe i should just curl
$jsonString = '"\n# If Interactive, set prompt to show ssh connection and current directory\n\nif ($null -ne $Host.UI) {\n\n  function prompt{\n    $cwd = $executionContext.SessionState.Path.CurrentLocation\n    $ssh = \"\"\n    \n    if ($env:SSH_CONNECTION) {\n        $ssh = \"ssh://\"\n    }\n    Write-Host \"# $ssh$Env:Username@$env:COMPUTERNAME\" -ForegroundColor DarkGray\n    Write-Host \"# $cwd\" -ForegroundColor DarkGray\n    Write-Host \"PS >\" -ForegroundColor DarkGreen -NoNewline\n    Write-Host $('' * ($nestedPromptLevel + 1)) -ForegroundColor DarkGray -NoNewline\n    return \" \"\n  }\n\n}\n"'
write-host $jsonString
# Deserialize the JSON string
$profilePath=".\tmp.ps1"
$object = $jsonString | ConvertFrom-Json
$object | Add-Content -Path $profilePath -Encoding utf8
# Access the properties of the deserialized object
write-host $object
