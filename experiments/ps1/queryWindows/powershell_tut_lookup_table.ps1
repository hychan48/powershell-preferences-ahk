<# #powershell
$parent_key_name="System"
# sep by |
$child_key_names= "ItemName|ItemUrl|FileExtension|FileName|FileAttributes|FileOwner|ItemType|ItemTypeText|KindText|Kind|MIMEType|Size|DateModified|DateAccessed|DateImported|DateAcquired|DateCreated|Author|Company|Copyright|Subject|Title|Keywords|Comment|SoftwareUsed|Rating|RatingText|ApplicationName|ItemPathDisplay"
# Convert to hash table. i.e. $System.ItemName = "ItemName"
# allowing user in ide to access it like a enumeration #>
function ConvertTo-HashTable {
  param (
      [string]$parent_key_name = "System",
      [string]$child_key_names = "ItemName|ItemUrl|FileExtension|FileName|FileAttributes|FileOwner|ItemType|ItemTypeText|KindText|Kind|MIMEType|Size|DateModified|DateAccessed|DateImported|DateAcquired|DateCreated|Author|Company|Copyright|Subject|Title|Keywords|Comment|SoftwareUsed|Rating|RatingText|ApplicationName|ItemPathDisplay"
  )

  # Create a new object
  $Object = New-Object PSObject

  # Split the child key names and add them as properties to the object
  $child_key_names -split '\|' | ForEach-Object {
      $Object | Add-Member -NotePropertyName $_ -NotePropertyValue $_
  }

  # Create new variable with the name of $parent_key_name
  New-Variable -Name $parent_key_name -Value $Object -Scope Global
}

<# # Now you can call the function like this
ConvertTo-HashTable

# And access the properties like this
$System.ItemName
$System.ItemUrl
$System.FileExtension
# and so on...
 #>
 