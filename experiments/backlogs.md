# Backlogs / Misc
* Windows Env
* rdc
* using node to generate binaries

* ahk can
* can upload to ftp... interesting

* https://github.com/Descolada/UIA-v2
* https://github.com/Descolada/wInspector
* interesting one

* add shortcut here
* BEL signal


# Breadcrumbs not snackbar
https://stackoverflow.com/questions/58900482/what-are-all-configuration-files-used-by-visual-studio-code

# PS1 Profile aliases
* Should think of common things
* explorer.exe url is common
* ctrl break
* ssh (seperate git atm)
* psexec
* maybe shortcut to launch / reattach powershell? (last window maybe)
    * also shortcut for vs code? or filter kinda thing
* convert path (other tool might help as well)
* download file from url (document)
## shortcut pref
* ctrl+space
    * tab completion in already pwsh win10? and winterminal
* f2 - rename
* disable right click copy if possible
* alt , - for settings / options
    * "experimental.rendering.forceFullRepaint": false,
    * maybe bcuz rdp but it disappears sometimes. like with telnet...
    * 
* copy path / relative path

## Default shortcuts
alt+w - history
* defaultProfile guid

# shortcut documentor
* i believe there a website that can generate


* vscode best practices for .vscode dir...
* folder options hidden show ext etc.


# keyboard shortcut workaround
[stack](https://stackoverflow.com/questions/48945319/a-keybindings-json-per-workspace-in-visual-studio-code)
[https://code.visualstudio.com/docs/getstarted/keybindings#_advanced-customization](https://)


```json
		// Set the executor of each language.
		"code-runner.executorMap": {
			"javascript": "node",
			"java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
			"c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
			"zig": "zig run",
			"cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
			"objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
			"php": "php",
			"python": "python -u",
			"perl": "perl",
			"perl6": "perl6",
			"ruby": "ruby",
			"go": "go run",
			"lua": "lua",
		},
		"code-runner.executorMapByFileExtension": {
			".vb": "cd $dir && vbc /nologo $fileName && $dir$fileNameWithoutExt",
			".vbs": "cscript //Nologo",
			".scala": "scala",
			".jl": "julia",
			".cr": "crystal",
			".ml": "ocaml",
			".zig": "zig run",
			".exs": "elixir",
			".hx": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
			".rkt": "racket",
			".scm": "csi -script",
			".ahk": "autohotkey",
			".au3": "autoit3",
    },
```

# PowerToys
https://github.com/microsoft/PowerToys/wiki
* Keyboard remapper...
* shortcut and stuff

* https://learn.microsoft.com/en-us/windows/powertoys/keyboard-manager


# Basically need macros
* in WindowsTerminal / VSCode
* Powershell.exe
* split tab etc
* 


# Actions
https://learn.microsoft.com/en-ca/windows/terminal/customize-settings/actions
https://aka.ms/terminal-profiles-schema


* ssh config with x11 alias
* alias

* maybe have ahk do some priority launching
* if bla is open then bla

# private trello
https://trello.com/b/EimzjAKJ/vscode
* apparently can't export without premium
* 
