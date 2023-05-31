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
MouseMove CX,CY
global fileObj
; file open for append


try {
  StartTime := A_TickCount
; Sleep 1000

Tmp := StartTime + 10000
loop 15{
  tooltip A_Index
  sleep 1000
  if(Tmp < A_TickCount){
    
    
    ElapsedTime := A_TickCount - StartTime
MsgBox ElapsedTime " milliseconds have elapsed." A_TickCount " " StartTime " " A_Index
return
  }
}

exit 
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
  ; i think it's 10 ms? im so confused
  Timeout := StartTime + 10000 ; 10 seconds
  while color == initial_color {
  ; todo add timeout from timeout.ahk
    if(Timeout > A_TickCount){
      ; FileAppend("Timeout in click_and_time.ahk`n", logname)
      fileObj.WriteLine(NameOfApp ":" StartTime ":" "Timeout")
      fileObj.Read(0)
      break
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
 