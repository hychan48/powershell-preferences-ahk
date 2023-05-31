#Requires AutoHotkey v2.0
#SingleInstance
SetWorkingDir A_ScriptDir
; https://www.autohotkey.com/docs/v2/FAQ.htm
; C:\Program Files\AutoHotkey
; "C:\Users\Jason\AppData\Local\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"

; https://www.autohotkey.com/boards/viewtopic.php?t=62346
; runwait Ahk2Exe.exe /in MyScript.ahk /out MyScript64.exe /bin "Unicode 64-bit.bin"
; https://www.autohotkey.com/boards/viewtopic.php?t=10620
out:= EnvGet("LOCALAPPDATA") "\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"
ahk2exe := EnvGet("LOCALAPPDATA") "\Programs\AutoHotkey\Compiler\Ahk2Exe.exe"

; out:=A_AhkVersion
; set defautls and saved in ui... not sure where it's saved though
; https://www.autohotkey.com/docs/v2/Scripts.htm
;get ahk filepath from parameter
ahk_script_name := A_Args[1]
; ahk_script_name := "cfw-folder-open.ahk" ; todo chang eas param

RunWait ahk2exe " /in " ahk_script_name


; tooltip out
; Sleep 1000

exit