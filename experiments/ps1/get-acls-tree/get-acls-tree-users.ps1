function treeLike{

  Get-ChildItem -Path 'C:\Users\Jason\.ssh\' -Recurse | ForEach-Object {
    # Determine the indentation level based on the current item's depth
    $indentation = "  " * ($_.FullName.Split('\').Count - 1)
  
    # Output the current item with appropriate indentation
    Write-Host "$indentation$($_.Name)"
  }

}  
function Get-DirectoryTreeWithAcl {
  param (
      [string]$Path
  )

  # Get ACL and item information for the specified path
  $item = Get-Item -Path $Path
  $acl = Get-Acl -Path $Path

  # Output the item name, ACL, and type (File or Directory)
  Write-Host "$($item.Name) ($($item.PSIsContainer ? 'Directory' : 'File'))"
  Write-Host "ACL:"
  $acl | Format-Table -AutoSize
  Write-Host "------------------------"

  # Recursively process subfolders
  if ($item.PSIsContainer) {
      $subItems = Get-ChildItem -Path $Path
      foreach ($subItem in $subItems) {
          Get-DirectoryTreeWithAcl -Path $subItem.FullName
      }
  }
}

# Specify the root folder for which you want to display the tree and ACL information
$rootFolder = 'C:\Users\Jason\.ssh\'

# Call the function to start the process
# Get-DirectoryTreeWithAcl -Path $rootFolder


# Get-Acl -Path $rootFolder'config' |Format-List

# net user
# Get the current user's SID
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userSID = $currentUser.User.Value

# Display the user's SID
Write-Host "User SID: $userSID"

# inheritance is from the folder?

$acl = Get-Acl -Path $rootFolder'config_test'

$inheritedPermissions = @()
$explicitPermissions = @()

foreach ($rule in $acl.Access) {
    if ($rule.IsInherited) {
        $inheritedPermissions += $rule
    } else {
        $explicitPermissions += $rule
    }
}

# Display inherited permissions
Write-Host "Inherited Permissions:"
$inheritedPermissions

# Display explicit permissions
Write-Host "Explicit Permissions:"
$explicitPermissions

net localgroup
# net group /domain 


# Get-LocalGroupMember -Group "GroupName" | Where-Object { $_.Name -eq "Jason" }