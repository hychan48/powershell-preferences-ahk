# Read .\config_clean.ps1 as a string
$filedir = $PSScriptRoot
$fileContent = Get-Content -Path $filedir\"config_clean.ps1" -Raw

# more efficient ways i think but let's just get this done asap
# maybe i dont want to use -raw?
#Convert to json string (serialize). probably dont need depth
$jsonString = $fileContent | ConvertTo-Json -Depth 100
# set-content / write to file
Set-Content -Path $filedir\"config_clean.json" -Value $jsonString