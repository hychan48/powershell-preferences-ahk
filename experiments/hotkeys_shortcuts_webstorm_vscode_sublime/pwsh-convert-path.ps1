<#
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/convert-path?view=powershell-7.3
basically find glob

pwsh.exe -file lib/test-utils/pwsh-test-mocha.ps1 "C:\Users\Public\temp spaces\a\b c\d"
pwsh.exe -file lib/test-utils/pwsh-test-mocha.ps1 '"C:\Users\Public\temp spaces\a\b c\d"'
pwsh.exe -file lib/test-utils/pwsh-test-mocha.ps1 '""C:\Users\Public\temp spaces\a\b c\d""'
pwsh.exe -file lib/test-utils/pwsh-test-mocha.ps1 C:\Users\Public\temp spaces\a\b c\d
#>
# clear-host
# write-host start
# Convert-Path . # same as pwd except string only
# (pwd).path
# # convert-path *
# write-host end

function Get-SlashPath{
  $path = "C:\Users\Username\Documents\file.txt"
  $convertedPath = $path.Replace('\', '/')
# Alternatively:
# $convertedPath = $path -replace '\\', '/'

Write-Host $convertedPath

}
# Get-SlashPath

<#
Convert-Path -LiteralPath "%APPDATA%"
Convert-Path -LiteralPath '%APPDATA%'
Convert-Path '%APPDATA%'
#>

$tmp = "sdf"
$tmp = '"sdf"'
write-host $tmp # sdf
write-host ($tmp -replace '^|$', '"') # "sdf"
write-host ($tmp -replace "^[`"`']", '') # sdf