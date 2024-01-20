# cfw-folder-open.md

* https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class
* https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm
* https://www.autohotkey.com/docs/v2/lib/DetectHiddenWindows.htm

* since im going by proces id.. let's try

* DetectHiddenWindows Mode
* 

```
SetTitleMatchMode MatchMode
SetTitleMatchMode Speed

1 = A window's title must start with the specified WinTitle to be a match.
2 = A window's title can contain WinTitle anywhere inside it to be a match.
3 = A window's title must exactly match WinTitle to be a match.
RegEx = Changes WinTitle, WinText, ExcludeTitle, and ExcludeText to accept regular expressions. For example: WinActivate "Untitled.*Notepad".
RegEx 

```