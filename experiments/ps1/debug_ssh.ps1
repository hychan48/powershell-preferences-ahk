#windows 10 ssh "shell request failed on channel 0"
# but works with permittty no
# ssh commands can be run though
# i.e. ssh localhost hostname -> Destop-XXXXXX

# wow this actually worked
# permittty yes then no
# as admin
# permittty no works... somethign is breaking it

Restart-Service sshd
Get-Service sshd
sshd -T

ssh localhost
ssh q
# this works...
ssh localhost hostname
ssh localhost '$profile'
ssh localhost '$psVersionTable'

# if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
#   Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
#   New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
# } else {
#   Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
# }


# default shell
# local machine - need admin. i think this is correct for ssh though?
regjump HKLM:\SOFTWARE\OpenSSH
# current usr
regjump HKCU:\SOFTWARE\OpenSSH
#this one broke it?
# wtf? maybe because i ssh from admin console?
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "$(where.exe pwsh)" -PropertyType String -Force

(Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\OpenSSH" -Name "DefaultShell")
(Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\OpenSSH" -Name "DefaultShell")
# c:/progra~1/powershell/7/pwsh.exe
code "c:/ProgramData\ssh\sshd_config"
code "c:/ProgramData\ssh\logs"
code "c:/ProgramData\ssh\logs"
# mismatch works to open... interesting
# https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_server_configuration#configuring-the-default-shell-for-openssh-in-windows
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

# wonder if it's one drive related

code $APPDATA/mintty/config
