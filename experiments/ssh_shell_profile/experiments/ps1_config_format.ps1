# Logic should be. if interactive session or ssh session then do this
# To reduce powershell lag
# it's always yellow nvm
# "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
# note pwsh and powershell have different default prompts


if ($null -ne $Host.UI) {
  # Interactive session / ssh is considered interactive
  # Write-Host "This is an interactive session."
  
  # all in grey? perhaps and on the line
  # user@computername perhaps ssh://user@computername
  # $cwd
  # destroys ppl using alt click though... interesting
  
  # $cwd = (Get-Location).Path # oh i see one follows the other one doesnt?
  $cwd = $executionContext.SessionState.Path.CurrentLocation # does this perform better?
  
  
  # zsh puts it in one line ontop
  # $ssh = $env:SSH_CONNECTION ? "ssh://" : ""
  # powershell doesnt have ternary operator?
  $ssh = ""
  if($env:SSH_CONNECTION) {
    $ssh = "ssh://"
  #   Write-Host " ssh://$Env:Username@$env:COMPUTERNAME" -ForegroundColor DarkGray -NoNewline
  #   # is this the format i want?
  }
  # Write-Host "# $ssh$Env:Username@$env:COMPUTERNAME" -ForegroundColor DarkGray -NoNewline
  Write-Host "# $ssh$Env:Username@$env:COMPUTERNAME" -ForegroundColor DarkGray

  # append newline
  # Write-Host ""

  Write-Host "# $cwd" -ForegroundColor DarkGray
  # Write-Host "# $cwd" -ForegroundColor DarkGray -NoNewline
  # <#PS#> might work for commenting
  # Write-Host "<# PS #>" -ForegroundColor White -NoNewline # White is reset
  # Write-Host "PS >" -ForegroundColor White -NoNewline # White is reset
  # Write-Host "PS >" -ForegroundColor DarkGreen -NoNewline # Dark green looks better
  Write-Host "PS >" -ForegroundColor DarkGreen -NoNewline # Dark green looks better
  
  # not sure what the star is really.... should i add the date?
  
  # Write-Host $('>' * ($nestedPromptLevel + 1)) #original from powershell default, whihc nmeans > repeat 1 more time than nested prompt level
  # in our case we dont need the + 1. interseting syntax
  Write-Host $('>' * ($nestedPromptLevel)) -ForegroundColor DarkGray -NoNewline # Dark green looks better # in our case
  # there's also background color...
  return " "
  
  
}
# else {
  #   # Non-interactive session
  #   Write-Host "This is a non-interactive session."
  # }
  
  
  # i think this changes the whole terminal?
  #   # $Green = [ConsoleColor]::Greenecho 
  #   # $DarkGray = [ConsoleColor]::DarkGray
  #   # $Cyan = [ConsoleColor]::Cyan
  #   # $Reset = [ConsoleColor]::White
  #Write-Host "" -ForegroundColor $Reset
  # Write-Host "color is cyan" -ForegroundColor ([ConsoleColor]::Cyan)
  # Write-Host "color is Greenecho" -ForegroundColor ([ConsoleColor]::Green)
  # i can totally reformat this or find in github
  
  # $var = "Hello, World!"
  
  # Write-Host $var   # Output is displayed directly in the console
  # Write-Output $var # Output is sent to the PowerShell pipeline
