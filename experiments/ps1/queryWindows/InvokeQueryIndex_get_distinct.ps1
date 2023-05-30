# Since distinct doesnt work and the docs suck
# system.search.hitcount
# https://learn.microsoft.com/en-us/windows/win32/properties/props-system-search-hitcount
# https://learn.microsoft.com/en-us/windows/win32/properties/props-system-search-store
# gpt4 couldnt do it. it's kidna close though

$connectionString = "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
$connection = New-Object -TypeName System.Data.OleDb.OleDbConnection -ArgumentList $connectionString
# surroudn wih try catch  
finally {
  $connection.Close()
}
# Start with an empty list of unique stores.
$uniqueStores = @()

do {
    # Build a query that excludes the stores we've already found.
    $query = "SELECT TOP 100 System.Search.Store FROM SystemIndex"
    if ($uniqueStores) {
        $excludeList = "'" + ($uniqueStores -join "','") + "'"
        $query += " WHERE System.Search.Store NOT IN ($excludeList)"
    }

    $command = New-Object -TypeName System.Data.OleDb.OleDbCommand -ArgumentList $query, $connection
    $adapter = New-Object -TypeName System.Data.OleDb.OleDbDataAdapter -ArgumentList $command

    $dataset = New-Object -TypeName System.Data.DataSet
    $adapter.Fill($dataset) | Out-Null

    # Add the new store to our list of unique stores.
    $newStore = $dataset.Tables[0] | Select-Object -ExpandProperty "System.Search.Store"
    if ($newStore) {
        $uniqueStores += $newStore
    }
}
while ($newStore)

$uniqueStores
