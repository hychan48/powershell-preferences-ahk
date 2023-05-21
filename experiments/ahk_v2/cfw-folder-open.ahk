#Requires AutoHotkey v2.0
#SingleInstance
SetWorkingDir A_ScriptDir
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
;-----
; revise later
;----
; save state
; dhw := A_DetectHiddenWindows
; DetectHiddenWindows false
; stmm := A_TitleMatchMode
; stmms := A_TitleMatchModeSpeed
; default is anywhere and fast
SetTitleMatchMode 2 ; anywhere
FileDelete('log.txt')
try {
  strInput := "ahk_exe trello" ;
wgpn := WinGetProcessName(strInput)
FileAppend("WinGetProcessName" wgpn "`n", "log.txt")
} catch Error as e {
  FileAppend("Error:e" "`n", "log.txt")
}

; ProcessGetName / ProcessGetPath
; WinGetProcessName

; //maybe check again
; DetectHiddenWindows true


; https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class
; https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm
; https://www.autohotkey.com/docs/v2/lib/DetectHiddenWindows.htm





tooltip "hi"
; Return Back to current editor
;----------------------




;----------------------
WinActivate(active_id)
MouseMove ogxpos, ogypos
sleep 1000 ;
Exit(0)
