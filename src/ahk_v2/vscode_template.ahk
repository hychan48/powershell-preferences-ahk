#Requires AutoHotkey v2.0
#SingleInstance

active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
; FileDelete('log.txt')

; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")
; Return Back to current editor
WinActivate(active_id)
MouseMove ogxpos, ogypos
Exit(0)
