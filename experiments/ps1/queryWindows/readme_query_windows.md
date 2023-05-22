# Query Windows Search Tool Synatx
1. Query indexed files first
2. 


ext:.txt

* filename
* foldername
* folders
* like?

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

# options
```ps1
not very helpful
regjump.exe HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search

regjump.exe HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SearchPlatform
```

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
# v5 only
$currentDisplay = Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams
$currentDisplay # print to console
# output is 
```