#Requires AutoHotkey v2.0
#SingleInstance
; Send "!{Tab}"

sleep 100

Click 649, 1262
send "^l"
sleep 100
send 'echo "hello world"{Enter}'
send 'ssh blabla{Enter}'
sleep 300
Send "{CtrlBreak}"
sleep 300
Send "{CtrlBreak}"
sleep 300
Send "{CtrlBreak}"
sleep 300
Click 752, 394 
; sleep 1000
; Send "{CtrlBreak}"

/*
read-host
*/