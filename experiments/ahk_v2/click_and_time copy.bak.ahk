#Requires AutoHotkey v2.0
#SingleInstance
; todo parametrize for re-use
; NameOfApp := "Localhost"
; logname := "spa_toggle_click.log"
; titlename := "toggle-click"
; ; Location to click and check for color
; CX := 100
; CY := 200
; if (A_Args.Length() < 5) {
;   MsgBox, You need to provide all the required arguments.
;   ExitApp
; }

; Location to click and check for color
CX := A_Args[1] ? A_Args[1] : 100
CY := A_Args[2] ? A_Args[2] : 200
NameOfApp := A_Args[3] ? A_Args[3] : "Localhost"
titlename := A_Args[4] ? A_Args[4] : "toggle-click"
logname := A_Args[5] ? A_Args[5] : "spa_toggle_click.log"



; title of the html. spa_toggle_click.html in chromium
WinActive(titlename)
WinWaitActive(titlename)
; Initialize variables, timers etc.
initial_color := PixelGetColor(CX, CY) ; should maybe sync with the html colors instead
StartTime := A_TickCount ; in milliseconds
MouseMove CX,CY
StartTime := A_TickCount
MouseClick "left"

; Wait for color to change
color := PixelGetColor(CX, CY)
while color == initial_color {
  ; todo add timeout from timeout.ahk
    sleep 10
    color := PixelGetColor(CX, CY)
    ; not actually validating the test application
    ; just checking that the color changed. i.e. if you alt tab still will work
    ; should actually look for the color toggle. which has not been confirmed
}
; log the time it took to change color
ElapsedTime := A_TickCount - StartTime
FileAppend(NameOfApp StartTime ":" ElapsedTime "`n", logname)
return
