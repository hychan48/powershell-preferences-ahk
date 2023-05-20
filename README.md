# powershell-preferences-ahk
PowerShell and Windows Terminal AHK shortcuts. Through AHK / JSON
[GitHub](https://github.com/hychan48/powershell-preferences-ahk)

# AHK / PowerShell Install Locations
* WindowsTerminal and pwsh recommended
```ps1
# https://stackoverflow.com/questions/4724290/powershell-run-command-from-scripts-directory
$PSScriptRoot     # the directory where the script exists, not the
                  ## target directory the script is running in
$PSCommandPath    # the full path of the script
```

# Ctrl+Break
* Due to keyboards not having ctrl c
* https://learn.microsoft.com/en-us/windows/console/ctrl-c-and-ctrl-break-signals
* i might not need it?

# Windows AHK Block Input
* [BlockInput](https://www.autohotkey.com/docs/v1/lib/BlockInput.htm)
1. `Ctrl+Alt+Del will re-enable input due to a Windows API feature.`
2. `Input blocking is automatically and momentarily disabled whenever an Alt event is sent (then re-enabled afterward)`
* `Input is automatically re-enabled when the script closes.`



# Shortcuts
* 
* alt_tilde_limit (maybe)
* ctrl+d in terminal should exit (powershelle tc)
* execute selection into terminal

# Backlog
## ahk
## Env vars for both windows and 
* maybe make converter later
* vscode extention for markdown
  * ctrl+space

# Import libs
* [UIA-v2](https://github.com/Descolada/UIA-v2)

# VSCode
* push to git using cmd first
* might use sublime merge or webstorm
* Settings.User < .Workspace.User < .vscode(Folder)

* Keyboard shortcuts

```yaml
settings:
  "files.eol": "\n",
```

```ps1
explorer.exe %USERPROFILE%\.vscode\extensions
```
# Systems Internal Eula
```ps1
regjump HKCU\Software\Sysinternals
```
