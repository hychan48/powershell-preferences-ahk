# Tested only on enhanced search index (Windows 10)
function Invoke-Query {
  param (
      [Parameter(Mandatory=$true)]
      [System.Data.OleDb.OleDbConnection]$Connection,

      [Parameter(Mandatory=$true)]
      [string]$Query
  )

  [System.Data.OleDb.OleDbCommand]$command = New-Object -TypeName System.Data.OleDb.OleDbCommand -ArgumentList $Query, $Connection
  [System.Data.OleDb.OleDbDataAdapter]$adapter = New-Object -TypeName System.Data.OleDb.OleDbDataAdapter -ArgumentList $command

  $dataset = New-Object -TypeName System.Data.DataSet
  #if $adapter
  # $adapter
  $adapter.Fill($dataset) | Out-Null

  if ($dataset.Tables[0].Rows.Count -eq 0) {
      if ($dataset.HasErrors) {
          $dataset.Tables[0].RowError
          Write-Host "Dataset Has errors"
      }
      else {
          Write-Host $Query
          Write-Host "No results found or query is incorrect."
      }
      return @()
  }

  return $dataset.Tables[0]
}

$connectionString = "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
$connection = New-Object -TypeName System.Data.OleDb.OleDbConnection -ArgumentList $connectionString
$connection.Open()

try {
  # Query 1
  # $projections = " System.FileName, System.ItemPathDisplay, System.FileExtension"
  # ItemUrl is unc file:C:/Users/username/...
  
  # KindType and KindText are blank for md files
  # $projections = " System.FileName, System.ItemPathDisplay, System.KindText" # md are blank
  # $projections = " System.FileName, System.ItemPathDisplay, System.Kind"
  # $projections = " System.FileName, System.ItemPathDisplay, System.MIMEType"


  # '.md' 'MD File'
  # $projections = " System.FileName, System.ItemPathDisplay, System.ItemType"
  # $projections = " System.FileName, System.ItemPathDisplay, System.ItemTypeText"
  
  
  # search rank is 1000 for readme_vscode.md. store is 'file'
  $projections = " System.FileName, System.Search.AutoSummary, System.Search.HitCount, System.Search.Rank, System.Search.Store, System.Search.GatherTime"
  
  
  
  $query1 = "SELECT TOP 10 $projections FROM SystemIndex `
   where System.FileName ='readme_vscode.md' and System.FileExtension = '.md'"
  #  where System.FileName like 'readme%'"
  $result1 = Invoke-Query -Connection $connection -Query $query1
  $result1
  # Process $result1...

  # Query 2
  # $query2 = "SELECT TOP 10 System.ItemPathDisplay, System.FileName, System.FileExtension FROM SystemIndex `
  $query2 = "SELECT TOP 10 $projections FROM SystemIndex `
  WHERE System.FileName LIKE 'readme[_]%.md' and System.FileExtension = '.md' `
  and System.Search.Rank = 1000"
  # 1000 is highest rank 0 is lowest
  # _ has to be escaped like [_] in sql
  # https://learn.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver16
  # might need to autopopulate the file extension? or same performance i wonder
  $result2 = Invoke-Query -Connection $connection -Query $query2
  # $result2 # if i want it in row list
  $result2 | Format-Table -AutoSize
  # Process $result2...
  # $query3="SELECT TOP 10 $projections ,System.FileAttributes FROM SystemIndex "
  $query3="SELECT TOP 10 $projections ,System.ItemType FROM SystemIndex "
  $query3+="where System.Search.Rank = 1000"
  # Invoke-Query -Connection $connection -Query $query3
  Invoke-Query -Connection $connection -Query $query3 |Format-Table
  
  
  # Try distinct values - doesnt work... would need to quey the whole table
  # crazy probably faster to do it in a loop
  $query4="SELECT DISTINCT System.Search.Store FROM SystemIndex"
  Invoke-Query -Connection $connection -Query $query4 |Format-Table
}
finally {
  $connection.Close()
}