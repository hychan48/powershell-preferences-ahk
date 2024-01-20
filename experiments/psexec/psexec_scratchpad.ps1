psexec -s -i 1 -d -accepteula -nobanner chrome.exe
# chrome flags to stop default and other warnings
# --no-first-run --no-default-browser-check --disable-infobars
pskill.exe chrome.exe
psexec -s -i 1 -d -accepteula -nobanner chrome.exe "--start-fullscreen --disable-session-crashed-bubble --no-first-run --no-default-browser-check --disable-infobars"

# chromium flags for disable
# psexec -s -i 1 -d -accepteula -nobanner chrome.exe --start-fullscreen --hide-crash-restore-bubble --no-first-run --no-default-browser-check --disable-infobars
psexec -s -i 1 -d -accepteula -nobanner chrome.exe --start-fullscreen --hide-crash-restore-bubble --no-first-run --no-default-browser-check --disable-infobars 

psexec -s -i 1 -d -accepteula -nobanner powershell.exe

psexec -s -i 1 -accepteula -nobanner powershell echo hi

# Will see output
psexec -s -nobanner -accepteula hostname

# will not see output, because output is redirected to the desktop (like you asked with -i 1)
psexec -s -i 1 -nobanner -accepteula hostname

# if you want to see the output. powershell -noexit and psexec -d (dont wait for exit)
psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ powershell -noexit hostname

# psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ chrome.exe "spa_toggle_click.html"

# this one works. perhaps i shouldnt make the background black. title is toggle-click
# id prefer if this is ran by the user but w/e
psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ chrome.exe --start-fullscreen --hide-crash-restore-bubble --no-first-run --no-default-browser-check --disable-infobars "file:///c:/AMD_VDI/spa_toggle_click.html"

pslist chrome.exe


psexec \\ws2019-1.mshome.net -u Administrator -p Amd123 powershell
psexec \\ws2019-1 -u Administrator -p Amd123 powershell
psexec \\ws2019-1 -u Administrator -p Amd123 -s -i 1 powershell

//some reason this
psexec \\ws2019-1.mshome.net -u Administrator -p Amd123 -s -i 1 powershell

psexec \\ws2019-1 -u Administrator -p Amd123 -s -i 1 powershell
# i thin i can use pxexec for this to transfer the binary

#----
# C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk
# dont need the ssh uri. just the Host alias because scp is implied to be ssh
# might want to do it on my admin machine though... cuz this is a bit slow
scp C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk vdid-1:/AMD_VDI/compile-exe.ahk