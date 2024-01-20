# from https://github.com/jhoneill/Get-IndexedItem
Import-module .\Get-IndexedItem.ps1 -Force
# Get-IndexedItem -Filter "Contains(*,'Stingray')", "kind = 'picture'", "keywords='portfolio'" -path ~ -recurse
# * stingray?
# shoul try this later.. kinda complex
Get-IndexedItem -Filter "Contains(*,'readme_')" -path ~ -recurse

# other examples
# https://github.com/jhoneill/Get-IndexedItem/blob/master/Get-IndexedItem.tests.ps1