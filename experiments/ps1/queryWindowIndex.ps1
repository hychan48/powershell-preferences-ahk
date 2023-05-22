# Set the file extension to query
$fileExtension = ".txt"

# Import the Microsoft.Windows.Search module
Import-Module Microsoft.Windows.Search

# Query file type kind using Windows Search
$query = "System.FileExtension:$fileExtension"
$results = Get-WDSIndexedFile -Property System.ItemName, System.ItemPath, System.Kind -Filter $query

# Output the results
$results | ForEach-Object {
    $filename = $_.System.ItemName
    $path = $_.System.ItemPath
    $kind = $_.System.Kind

    Write-Host "File Name: $filename"
    Write-Host "Path: $path"
    Write-Host "Kind: $kind"
    Write-Host "-------------------------"
}
