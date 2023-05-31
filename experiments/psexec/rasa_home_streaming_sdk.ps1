# More ahk related 
Write-Output 'transfering ahk scripts...'
$ahkToCompileList = @(
    "C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\click_and_time.ahk"
    # "C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\powershell5_run_workaround.ahk"
)

# iterate over each file in the list
# should have better error handling. file wont copy if still running...
# pskill click_and_time.exe
# pskill powershell5_run_workaround.exe
foreach ($ahkToCompile in $ahkToCompileList) {
    # parse filename without ext
    $ahkToCompileName = [System.IO.Path]::GetFileNameWithoutExtension($ahkToCompile)
    $ahkToCompileName

    # get current cwd of ps1
    $scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
    $outfile = "$ahkToCompileName.exe"
    $outpath = "$scriptPath\$outfile"

    C:\Users\Jason\AppData\Local\Programs\AutoHotkey\Compiler\Ahk2Exe.exe /in "$ahkToCompile" /out $outpath

    # not working syntax
    # scp $outpath vdid-1:C:\\AMD_VDI\\$outfile
    # scp $outpath vdid-1:/c/AMD_VDI/$outfile
    
    # copy to boht servers
    scp $outpath vdid-1:/AMD_VDI/$outfile
    scp $outpath vdid-2:/AMD_VDI/$outfile
}

# compile first

# scp C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk vdid-1:/AMD_VDI/compile-exe.ahk
# scp C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk vdid-1:/AMD_VDI/compile-exe.ahk

# might just use ssh command out of lazyiness
# ssh vdid-1 'powershell.exe -ExecutionPolicy Bypass -File C:\AMD_VDI\compile-exe.ahk'
# or just run it normamly
# $ahkToCompile = "C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\click_and_time.ahk"
# $ahkToCompile = "C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\powershell5_run_workaround.ahk"

# # parse filename without ext
# $ahkToCompileName = [System.IO.Path]::GetFileNameWithoutExtension($ahkToCompile)
# $ahkToCompileName
# # get current cwd of ps1
# $scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
# $outfile="$ahkToCompileName.exe"
# $outpath="$scriptPath\$outfile"
# C:\Users\Jason\AppData\Local\Programs\AutoHotkey\Compiler\Ahk2Exe.exe /in "$ahkToCompile" /out $outpath

# # scp $outpath vdid-1:C:\\AMD_VDI\\$outfile
# # scp $outpath vdid-1:/c/AMD_VDI/$outfile
# scp $outpath vdid-1:/AMD_VDI/$outfile

# C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk C:\Users\Jason\VSCodeProjects\powershell-preferences-ahk\experiments\ahk_v2\compile-exe.ahk

# ssh vdid-1 'powershell.exe hostname'
# loop echo hi 10 times with a sleep
# for ($i=0; $i -lt 10; $i++) {
#     # ssh vdid-1 'powershell.exe -ExecutionPolicy Bypass -File C:\AMD_VDI\click_and_time.exe'
#     echo hi
#     Start-Sleep -Seconds 1
# }


# doesnt work without -d??? what gives

# psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ C:\AMD_VDI\click_and_time.exe
# MsgBox "CX: " CX " CY: " CY " NameOfApp: " NameOfApp " titlename: " titlename " logname: " logname

psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ C:\AMD_VDI\click_and_time.exe 300 300 "TightVNC" "ws2019-1 - TightVNC Viewer"
pskill -nobanner click_and_time.exe

# psexec -s -i 1 -nobanner -accepteula -w C:\AMD_VDI\ C:\AMD_VDI\click_and_time.exe
# psexec -s -i 1 -nobanner -accepteula -w C:\AMD_VDI\ C:\AMD_VDI\click_and_time.exe

# psexec -s -i 1 -nobanner -accepteula -d -w C:\AMD_VDI\ chrome.exe --hide-crash-restore-bubble --no-first-run --no-default-browser-check --disable-infobars "file:///c:/AMD_VDI/spa_toggle_click.html"
# psexec -s -i 1 -nobanner -accepteula -w C:\AMD_VDI\ chrome.exe --hide-crash-restore-bubble --no-first-run --no-default-browser-check --disable-infobars "file:///c:/AMD_VDI/spa_toggle_click.html"