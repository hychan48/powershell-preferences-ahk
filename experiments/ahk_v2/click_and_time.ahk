#Requires AutoHotkey v2.0
#SingleInstance
DetectHiddenWindows 1
; if (A_Args.Length() < 5) {
;   MsgBox, You need to provide all the required arguments.
;   ExitApp
; }

; Location to click and check for color
CX := A_Args.Length >= 1 ? A_Args[1] : 100
CY := A_Args.Length >= 2 ? A_Args[2] : 200
NameOfApp := A_Args.Length >= 3 ? A_Args[3] : "Localhost"
titlename := A_Args.Length >= 4 ? A_Args[4] : "toggle-click"
logname := A_Args.Length >= 5 ? A_Args[5] : "spa_toggle_click.log"

; MsgBox "CX: " CX " CY: " CY " NameOfApp: " NameOfApp " titlename: " titlename " logname: " logname
; Exit
; because psexec

; title of the html. spa_toggle_click.html in chromium
; WinWait(titlename,,5)
; msgbox "wait",,"t5"
tooltip "wait"
; no msg box?
WinWait(titlename,,5) ; hard to debug cant see mouse through rdp
WinActivate(titlename) ; wow typo had active instead of activate
WinWaitActive(titlename,,5)
tooltip "mousemove"
MouseMove CX,CY + 50 ;offsett the check by 50 pixels, i think the (higher to check )
; i.e. checks higher than the mouse. for obv reasonss
global fileObj
; file open for append
try {
  fileObj := FileOpen(logname, "a")
    ; loop 10 times
  loop 10 {
    ; click and check for color change
    ClickAndCheck()
    ; wait 1 second; can use setimer, but this is simpler
    sleep 1000
    ; can flush buffer but w/e
    ; fileObj.Read(0) ; flush buffer syntax
  }
}
catch Error {
    ; MsgBox Error
    ; FileAppend("Some error in click_and_time.ahk`n", logname)
    fileObj.WriteLine("Some error in click_and_time.ahk")
    throw Error
    
}finally{
  if(HasMethod(fileObj, "Close")){
    fileObj.Close()
  }
}


ClickAndCheck(){
  ; Initialize variables, timers etc.
  initial_color := PixelGetColor(CX, CY) ; should maybe sync with the html colors instead
  StartTime := A_TickCount
  
  ; Click - yep... dont see anything
  ; MouseClick "left"
  tooltip "Click"
  MouseClick
  ; Click
  tooltip "clicked and waiting"
  ; Wait for color to change
  color := PixelGetColor(CX, CY)
  ; Timeout := StartTime + 10000 ; 10 seconds
  Timeout := StartTime + 2000 ; 2 seconds might be more fair...
  ; todo add timeout to params
  while color == initial_color {
  ; Exits when color changes or timeout
  if(Timeout < A_TickCount){
      ; FileAppend("Timeout in click_and_time.ahk`n", logname)
      fileObj.WriteLine(NameOfApp ":" StartTime ":" "Timeout")
      fileObj.Read(0)
      return
      ; throw "Timeout"
    }
    sleep 10
    color := PixelGetColor(CX, CY)
    ; not actually validating the test application
    ; just checking that the color changed. i.e. if you alt tab still will work
    ; should actually look for the color toggle. which has not been confirmed
  }
  ; log the time it took to change color
  ElapsedTime := A_TickCount - StartTime
  global fileObj
  fileObj.WriteLine(NameOfApp ":" StartTime ":" ElapsedTime)
  return
}
 