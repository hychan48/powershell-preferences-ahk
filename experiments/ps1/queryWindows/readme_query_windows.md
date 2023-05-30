
# Query Windows Search Tool Synatx
1. Query indexed files first
2. I think start menu is priority
3. there is also .searches
```bash
C:\Users\Jason\OneDrive\wdev_jc_main\windows_ux
```
# voidtools everything... free tool
https://www.voidtools.com/support/everything/installing_everything/

# everything toolbar
https://github.com/srwi/EverythingToolbar


ext:.txt

* filename
* foldername
* folders
* like?

# Query
https://learn.microsoft.com/en-us/windows/win32/search/-search-sql-windowssearch-entry


https://learn.microsoft.com/en-us/sql/ado/guide/data/service-providers-and-components?view=sql-server-ver16
https://learn.microsoft.com/en-us/sql/ado/guide/data/service-providers-and-components?view=sql-server-ver16

# Scope / Root to search
* foldername:MyDocuments or in:MyDocuments
* store:files


# Type is kind?
kind:folders
kind:favorites
kind:pdf

social NOT security
social security	
social OR security	

report isonline:true	
maybe add tag?

# options?
```ps1
not very helpful
regjump.exe HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search

regjump.exe HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform

C:\ProgramData\Microsoft\Search\Data\Applications\Windows


```

# Exclusion Regex
regjump HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\Gather\Windows\SystemIndex\Sites\LocalHost\Paths

# Reduced Set of Fields from Windows Search
```ps1
$PropertyAliases   = @{Width         = "System.Image.HorizontalSize";       Height = "System.Image.VerticalSize"; Name   = "System.FileName";
                       Extension     = "System.FileExtension";        CreationTime = "System.DateCreated";        Length = "System.Size";
                       LastWriteTime = "System.DateModified";              Keyword = "System.Keywords";           Tag    = "System.Keywords"
                       CameraMaker   = "System.Photo.Cameramanufacturer"; Software = "System.ApplicationName"}
$FieldTypes = "System", "Photo", "Image", "Music", "Media", "RecordedTv", "Search", "Audio"
$SystemPrefix     = "System."            ;     
$SystemFields = "ItemName|ItemUrl|FileExtension|FileName|FileAttributes|FileOwner|ItemType|ItemTypeText|KindText|Kind|`
MIMEType|Size|DateModified|DateAccessed|DateImported|DateAcquired|DateCreated|Author|Company|Copyright|Subject|Title|`
Keywords|Comment|SoftwareUsed|Rating|RatingText|ApplicationName|ItemPathDisplay"

$SearchPrefix     = "System.Search."     ;     $SearchFields = "AutoSummary|HitCount|Rank|Store" #https://docs.microsoft.com/en-gb/windows/desktop/properties/search-bumper

```
# Filtered Set of Fields from Windows Search
* C:\Users\Jason\Searches
* kindpdf.search-ms
* i can open and trigger it
* also search-connectors...

```ps1
Start-Process -FilePath "search:"

$PropertyAliases   = @{Width         = "System.Image.HorizontalSize";       Height = "System.Image.VerticalSize"; Name   = "System.FileName";
                       Extension     = "System.FileExtension";        CreationTime = "System.DateCreated";        Length = "System.Size";
                       LastWriteTime = "System.DateModified";              Keyword = "System.Keywords";           Tag    = "System.Keywords"
                       CameraMaker   = "System.Photo.Cameramanufacturer"; Software = "System.ApplicationName"}
$FieldTypes = "System", "Photo", "Image", "Music", "Media", "RecordedTv", "Search", "Audio"
$SystemPrefix     = "System."            ;     
$SystemFields = "ItemName|ItemUrl|FileExtension|FileName|FileAttributes|FileOwner|ItemType|ItemTypeText|KindText|Kind|`
MIMEType|Size|DateModified|DateAccessed|DateImported|DateAcquired|DateCreated|Author|Company|Copyright|Subject|Title|`
Keywords|Comment|SoftwareUsed|Rating|RatingText|ApplicationName|ItemPathDisplay"

$SearchPrefix     = "System.Search."     ;     $SearchFields = "AutoSummary|HitCount|Rank|Store" #https://docs.microsoft.com/en-gb/windows/desktop/properties/search-bumper

```


Documents: readme_query_windows.md
* tagging / author
* perhaps ui to add tags / cross platform
* with user acces control (single user is ok)
* free hosting ideal but office 365 is ok
* and / or proxy app to sync clipboard / filecopy



```ps1
# v5 onlyP
$currentDisplay = Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams
$currentDisplay # print to console
# output is 
```

# ok hopeless . ahk can do it easier - for finding monitors



"Provider=Search.CollatorDSO;Extended Properties=’Application=Windows’;"

# got the query done in the file
InvokeQueryIndex.ps1
Note. the index is grabbing things from node_modules...
* perhaps i should exclude that folder
https://superuser.com/questions/1003878/how-to-efficiently-exclude-svn-and-git-folders-in-windows-10-indexing
https://learn.microsoft.com/en-us/windows/win32/search/-search-3x-wds-mngidx-overview
https://learn.microsoft.com/en-us/windows/win32/search/-search-3x-wds-extidx-overview

# There is one indexing...
# and scope
https://learn.microsoft.com/en-us/windows/win32/lwef/-search-2x-wds-aqsreference

# system.search.hitcount
https://learn.microsoft.com/en-us/windows/win32/properties/props-system-search-hitcount
https://learn.microsoft.com/en-us/windows/win32/properties/props-system-search-store


# Register hot key?
https://www.nirsoft.net/utils/hot_keys_list.html
* is there bulk download


# defn a bunch of things to do here...
* need to add some filters for today
* readme etc...
* maybe add like a session thing
* cross platform support would be nice
* cloud is a must


# I want to debug
* maybe query clipboard or something for urls
* https://learn.microsoft.com/en-us/uwp/api/windows.system.virtualkey?view=winrt-22621
  * dec
* https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
  * vk in hex

* everything ini

# scan codes?
* https://www.autohotkey.com/board/topic/13958-debugging-scancodes/



# right click menu
https://www.nirsoft.net/utils/shell_menu_view.html

* wow
https://www.nirsoft.net/utils/fastresolver.html


* networkinterfacesview.exe
* awesome