#Requires AutoHotkey v2.0
#SingleInstance
SetWorkingDir A_ScriptDir
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
logfile := "log.txt"
;-----
; revise later
;----
; save state
; dhw := A_DetectHiddenWindows
; DetectHiddenWindows false
; stmm := A_TitleMatchMode
; stmms := A_TitleMatchModeSpeed
; default is anywhere and fast
; SetTitleMatchMode 2 ; anywhere
SetTitleMatchMode "RegEx" ; anywhere
sProcessName:= ""
if(A_Args.Length < 1){
  IB := InputBox("Exe Name to open", "todo... last active maybe", "w640 h480 t10")
if IB.Result != "OK"
    ExitApp()

    if(!IB.Value){
      tooltip "Empty value?"
      sleep 1000
      ExitApp()
    }
    sProcessName := IB.Value
}

; should check if it's a file or a folder... then open

if FileExist(logfile){ 
  FileDelete(logfile) 
}
; todo add parameter
;----
try {
  ; strInput := "ahk_exe explorer.exe" ;works with 2, need a test runner or get gud
  ; WinActivate "ahk_exe i)\\notepad\.exe$"  ; Match the name part of the full path.
  ; strInput := "ahk_exe i)exp*" ;
  sRegex := "ahk_exe i)" sProcessName "*" ;
  wgpn := WinGetProcessName(sRegex)
  ; tooltip "hi"
  FileAppend("WinGetProcessName:" wgpn "`n", logfile)
  FileAppend("WinGetProcessPath:" WinGetProcessPath(sRegex) "`n", logfile)
} catch Error as e {
  FileAppend("Error:" e.Message "`n", logfile)
  tooltip "error"
}
;----
; ProcessGetName / ProcessGetPath
; WinGetProcessName

; //maybe check again
; DetectHiddenWindows true


; https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class
; https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm
; https://www.autohotkey.com/docs/v2/lib/DetectHiddenWindows.htm






; Return Back to current editor
;----------------------




;----------------------
WinActivate(active_id)
MouseMove ogxpos, ogypos
; sleep 1000 ; should probably add some flag here like tmp or err
ExitApp()
