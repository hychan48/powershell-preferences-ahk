#Requires AutoHotkey v2.0
#SingleInstance
SetWorkingDir A_ScriptDir

FileDelete('ahk_log.log')
; WinMove
; 
; for loop

app_id := WinGetID('Koikatu')
; app_id := WinGetID('Notepad')
FileAppend("app_id :" app_id "`n", 'ahk_log.log')
WinMove( 0, 0,,,app_id)
; WinMove( 0, 0,,,app_id)
ExitApp()
