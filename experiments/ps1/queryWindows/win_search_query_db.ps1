<# 
https://learn.microsoft.com/en-us/windows/win32/search/-search-3x-wds-qryidx-overview 
Querying the Index Programmatically
OLE DB
https://github.com/Microsoft/Windows-classic-samples/tree/main/Samples/Win7Samples/winui/WindowsSearch

semi generated code
#>
$query = "SELECT TOP 10 System.ItemPathDisplay, System.FileName, System.FileExtension FROM SystemIndex"


$connectionString = "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
$connection = New-Object -TypeName System.Data.OleDb.OleDbConnection -ArgumentList $connectionString
$command = New-Object -TypeName System.Data.OleDb.OleDbCommand -ArgumentList $query, $connection
# $command # print for debug
$adapter = New-Object -TypeName System.Data.OleDb.OleDbDataAdapter -ArgumentList $command

$dataset = New-Object -TypeName System.Data.DataSet
$adapter.Fill($dataset) # fetch the data into $dataset.Tables[0]
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
    #return empty array?
    return

}
return $dataset.Tables[0] # return the data
# $dataset.Tables[0] | Format-Table -AutoSize
# $dataset.Tables[0].Rows.Count
# $dataset.Tables[0] | Format-Table -AutoSize
