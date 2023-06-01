$profilePath = $PROFILE
if (-not (Test-Path $profilePath) -or (Get-Content $profilePath -Raw) -notmatch "function prompt") {
    # If the $Profile file doesn't exist or doesn't contain the prompt function, append the snippet
    
    
    $snippet = @'

# If Interactive, set prompt to show ssh connection and current directory
if (\$null -ne \$Host.UI) {
    function prompt {
        \$cwd = \$executionContext.SessionState.Path.CurrentLocation
        \$ssh = ""
        
        if (\$env:SSH_CONNECTION) {
            \$ssh = "ssh://"
        }
        Write-Host "# \$ssh\$Env:Username@\$env:COMPUTERNAME" -ForegroundColor DarkGray
        Write-Host "# \$cwd" -ForegroundColor DarkGray
        Write-Host "PS >" -ForegroundColor DarkGreen -NoNewline
        Write-Host ('' * (\$nestedPromptLevel + 1)) -ForegroundColor DarkGray -NoNewline
        return " "
    }
}
'@
    # fixme new-directory and also parse the folder name automatically
    $profileFolderPath = Split-Path $profilePath
    # Create the directory if it doesn't exist
    if (-not (Test-Path -Path $profileFolderPath -PathType Container)) {
        New-Item -Path $profileFolderPath -ItemType Directory | Out-Null
    }
    $snippet | Add-Content -Path $profilePath -Encoding utf8
    # $snippet | Add-Content -Path $profile -Encoding utf8
}
