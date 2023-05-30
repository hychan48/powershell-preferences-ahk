#Requires AutoHotkey v2.0
#SingleInstance
SetWorkingDir A_ScriptDir
; must be admin
; out:= EnvGet("LOCALAPPDATA") "\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"
; C:\Program Files\AutoHotkey
; if not A_IsAdmin
;   try
;     {
;         if A_IsCompiled
;             Run '*RunAs "' A_ScriptFullPath '"'
;             ; Run '*RunAs "' A_ScriptFullPath '" /restart'
;         else
;             Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
;     }
;     ExitApp
; WinGet, active_id, ID, "A"
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
; FileDelete('log.txt')
; tooltip "hi"
; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")
; Return Back to current editor
;----------------------
; when hyper v isnt working
; WinActivate("ahk_pid 28472")
; WinActivate("ahk_exe vmconnect.exe deb1")
WinActivate("ahk_exe vmconnect.exe")
; slow send mdoe SetKeyDelay
; SetKeyDelay 

; block of commands
SetKeyDelay 0,0 ; -1,-1
; ip route del 8.8.8.8 via 172.17.55.193 dev eth0
; ip route add 8.8.8.8 dev eth0
; ip route del 8.8.8.8 dev eth0
;#ip route show > routing_table.txt
; #ip route del default via 8.8.8.8 metric 99 dev eth0
; #ip route add default via 8.8.8.8 metric 99 dev eth0
; ip route add default via 192.168 metric 99 dev eth0

; ip route del default via 172.17.55.193 metric 100 dev eth0
; #ip route add default via 172.17.55.193 metric 100 dev eth0

; # google ipv6 dns
; ; 2001:4860:4860::8844
block := "
(
echo hi
;bla





)"
lines := StrSplit(block, "`n")

for index, line in lines
{
    line := Trim(line)
    ; RegExMatch(myString, "^\s*;")
    if line != ""  or RegExMatch(line, "^\s*;") = ";" ; Skip empty lines
    {
        send(line)
        send("{Enter}")
    }
}
; Send("ip route add 8.8.8.8 via 172.17.55.193 dev eth0")
; Send("{Enter}")
; ControlFocus("IHWindowClass1")
; ControlSend("echo hi","OPWindowClass2")
; ClassNN: OPWindowClass2
; Screen: x: 429 y: 1598
; Text: Output Painter DX Child b'l/indow
;----------------------
WinActivate(active_id)
MouseMove ogxpos, ogypos
; sleep 1000
Exit(0)
