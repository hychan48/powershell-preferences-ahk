$profilePath = $PROFILE
$snippet = @"
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
"@
write-host $snippet
