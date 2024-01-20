# $tmp = pslist -accepteula -nobanner autohotkey | Format-Table -AutoSize
# $tmp # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/format-table?view=powershell-7.3
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.3
# Select-Object -Unique -Property Name -InputObject $tmp
# Select-Object Name -InputObject $tmp
# $tmp | Select-Object Name
# $tmp

<# 
Name             : ConsoleHost
Version          : 7.3.4
InstanceId       : 8b0c2fd6-aad3-49a0-8fe7-5daa49baf328
UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
CurrentCulture   : en-CA
CurrentUICulture : en-US
PrivateData      : Microsoft.PowerShell.ConsoleHost+ConsoleColorProxy
DebuggerEnabled  : True
IsRunspacePushed : False
Runspace         : System.Management.Automation.Runspaces.LocalRunspace 
#>
(get-host).GetType() #System.Management.Automation.Host.PSHost

# System.Array
(Get-Host | Format-Table -AutoSize).GetType()
# (Get-Host | Format-Table -AutoSize)


# get-process | where-object {$_.name  -Like "autohotkey"}

# from chat gpt
# Query data and filter using Format-Table

# Query data (replace with your own command or data source)
# $data = Get-Process

# Apply filter
# $filteredData = $data | Where-Object { $_.Name -like 'chrome*' }

# Format and display the filtered data
# $filteredData | Format-Table -AutoSize
# $filteredData | Format-Table -AutoSize | Get-member -Name ProcessName
# cls
# $processNameID = ($filteredData | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -eq 'ProcessName' }).Definition
# $processNameID = ($filteredData | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -eq 'ProcessName' }).Definition
# $processNameID = ($filteredData | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -like '*__NounName' }).Name

# $filteredData | Get-Member -MemberType NoteProperty
# $filteredData | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -eq 'ProcessName' }
# $filteredData | Format-Table -AutoSize |Select-Object ProcessName, SI | Format-Table -AutoSize


# 
(pslist -accepteula -nobanner autohotkey).GetType()


# # Your existing code that generates the Format-Table object
# # $formatTableObject = Get-Process | where-object {$_.name  -Like "autohotkey"}
# $formatTableObject = Get-Process | where-object {$_.name -Like "*auto*"}| Format-Table
# $propertyNames = $formatTableObject | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name
# $propertyNames
# $formatTableObject
# # Select only the "ProcessName" and "SI" columns
# $selectedColumns = $formatTableObject | Select-Object ProcessName, SI,name

# # Display the selected columns
# $selectedColumns

# echo Snippets in Visual Studio Code

# Your existing code that generates the Format-Table object


# https://code.visualstudio.com/docs/editor/tasks
Write-Output "----------- Start again ------------"
$formatTableObject = Get-Process |Select-Object --sor| Where-Object { $_.Name -like 'auto*' } | Format-Table
$formatTableObject

# todo fixname kill-process. wrong verb. kill needs to be renamed to 
# in power shell
function kill-process{
  
}
