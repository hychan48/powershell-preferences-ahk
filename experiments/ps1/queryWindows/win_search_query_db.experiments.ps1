<# 
https://learn.microsoft.com/en-us/windows/win32/search/-search-3x-wds-qryidx-overview 
Querying the Index Programmatically
OLE DB
https://github.com/Microsoft/Windows-classic-samples/tree/main/Samples/Win7Samples/winui/WindowsSearch

semi generated code
#>

# Define the search parameters
$fileName = "Sandboxie-Plus"
# $fileName = "readme_windowsOS"
$fileExtension = ""
$fileContent = ""  # comment this line if you don't want to search by content


# Create the search query for MS SQL Server.
# https://learn.microsoft.com/en-us/sql/t-sql/language-elements/expressions-transact-sql?view=sql-server-ver16
# select TOP ($top_limit)
# $query = "SELECT TOP 10 System.ItemPathDisplay, System.FileName, System.FileExtension FROM SystemIndex " +
    # "WHERE System.FileName LIKE '$fileName'"

# $query = "SELECT TOP 10 (System.*) FROM SystemIndex"

$query = "SELECT TOP 10 System.ItemPathDisplay, System.FileName, System.FileExtension FROM SystemIndex"

# _ needs to be escaped
# https://learn.microsoft.com/en-us/sql/t-sql/language-elements/expressions-transact-sql?view=sql-server-ver16
# $query += " where System.FileName LIKE 'readme|_%'"; # _ needs to be escaped with |
# $query += " where System.FileName LIKE 'readme%"; # _ needs to be escaped with |
# $query += " where System.FileName LIKE 'readme_%'"; # for testing fill error... so readme.md was pulled
# it shouldnt be pulling readme.md

# select System doesnt work. neither does System.* or *
# $query = "SELECT TOP 10 System FROM SystemIndex"
# $query = "SELECT TOP 10 System.FileName from SystemIndex"
# columns names are System.FileName, System.FileExtension, System.FileContents, System.ItemPathDisplay
# full list can be found at
# https://learn.microsoft.com/en-ca/windows/win32/properties/core-bumper
# https://learn.microsoft.com/en-us/windows/win32/properties/propdesc-schema-searchinfo
if ($fileExtension) {
    $query += " AND System.fileExtension LIKE '$fileExtension'"
}
if ($fileContent) {
    $query += " AND System.FileContents LIKE '$fileContent'"
}

# Execute the search query
# i think there is a timeout setting somewhere too
$connectionString = "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
$connection = New-Object -TypeName System.Data.OleDb.OleDbConnection -ArgumentList $connectionString
$command = New-Object -TypeName System.Data.OleDb.OleDbCommand -ArgumentList $query, $connection
# $command # print for debug
$adapter = New-Object -TypeName System.Data.OleDb.OleDbDataAdapter -ArgumentList $command

$dataset = New-Object -TypeName System.Data.DataSet
# $dataset.ContainsListCollection
# $dataset.ContainsListCollection # $true is a system.data.dataset? wow
# Print the results
# if count is 0, then no results were found
# $adapter
$adapter.Fill($dataset)
# clear adapter
# $adapter.Dispose()
# $adapter.Fill($dataset) | Out-Null # hide errors
if ($dataset.Tables[0].Rows.Count -eq 0) {
    #print the error if $dataset.HasErrors is true
    if ($dataset.HasErrors) {
      $dataset.Tables[0].RowError
      Write-Host "Dataset Has errors"
    }
    else{
      Write-Host $query
      Write-Host "No results found or query is incorrect."
    }
    


    return
}

$dataset.Tables[0] | Format-Table -AutoSize
$dataset.Tables[0].Rows.Count
# $dataset.Tables[0] | Format-Table -AutoSize
