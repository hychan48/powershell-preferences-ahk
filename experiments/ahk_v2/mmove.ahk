#Requires AutoHotkey v2.0
#SingleInstance
; https://www.autohotkey.com/docs/v2/Scripts.htm#cmd
; https://www.autohotkey.com/docs/v2/lib/MouseMove.htm
; https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setphysicalcursorpos
; DllCall("SetCursorPos", "int", 100, "int", 400)
if A_Args.Length < 2
{
    MsgBox "This script requires at least 2 parameters but it only received " A_Args.Length "."
    ExitApp
}
x := A_Args[1]
y := A_Args[2]
if (A_Args.Length >= 3){
    ; "Screen" is default
    ; Window, Client
    CoordMode("Mouse", A_Args[3])
}
MouseMove x,y
