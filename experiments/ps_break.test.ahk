#SingleInstance, force
#NoEnv
; Reminder v1
; MyString := "This is a literal string."
; MyString = This is a literal string.

SetWorkingDir %A_ScriptDir%
; if not A_IsAdmin
; 	Run *RunAs "%A_ScriptFullPath%" ;
; WinGet, active_id, ID, "A"
WinGet, active_id, ID
MouseGetPos, ogxpos, ogypos
; https://www.autohotkey.com/docs/v1/lib/FileAppend.htm
FileDelete log.txt
FileAppend, hi`n, log.txt
WinActivate %active_id%

; psexec \\pause.local powershell echo hi
tooltip "hi"

; FileDelete('log.txt')

; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")
; Return Back to current editor
;---------------



;---------------

WinActivate %active_id%
MouseMove %ogxpos%, %ogypos%
; sleep 1000 ; if using tooltip to debug
return
