$profilePath = $PROFILE
if (-not (Test-Path $profilePath) -or (Get-Content $profilePath -Raw) -notmatch "function prompt") {
    # If the $Profile file doesn't exist or doesn't contain the prompt function, append the snippet
    $rawJSON = @'
"# If Interactive, set prompt to show ssh connection and current directory. ensure no single quotes\nif ($null -ne $Host.UI) {\n\n  function prompt{\n    $cwd = $executionContext.SessionState.Path.CurrentLocation\n    $ssh = \"\"\n    \n    if ($env:SSH_CONNECTION) {\n        $ssh = \"ssh://\"\n    }\n    Write-Host \"# $ssh$Env:Username@$env:COMPUTERNAME\" -ForegroundColor DarkGray\n    Write-Host \"# $cwd\" -ForegroundColor DarkGray\n    Write-Host \"PS >\" -ForegroundColor DarkGreen -NoNewline\n    Write-Host $(\">\" * ($nestedPromptLevel)) -ForegroundColor DarkGray -NoNewline\n    return \" \"\n  }\n\n}\n"
'@
    $snippet = $rawJSON | ConvertFrom-Json
    # fixme new-directory and also parse the folder name automatically
    $profileFolderPath = Split-Path $profilePath
    # Create the directory if it doesn't exist
    if (-not (Test-Path -Path $profileFolderPath -PathType Container)) {
        New-Item -Path $profileFolderPath -ItemType Directory | Out-Null
    }
    $snippet | Add-Content -Path $profilePath -Encoding utf8
    # $snippet | Add-Content -Path $profile -Encoding utf8
}
