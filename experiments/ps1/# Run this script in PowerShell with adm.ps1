# Run this script in PowerShell with administrative privileges

param (
    [string]$gitUser = 'hychan48' # Default GitHub user
)

# 1. Enable OpenSSH features
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# 2. Set OpenSSH Server service to start automatically
Set-Service -Name sshd -StartupType 'Automatic'

# Start the service
Start-Service sshd

# 3. Download GitHub user's public SSH key and add to authorized_keys
$pubKeyURL = "https://github.com/$gitUser.keys"
$pubKey = Invoke-WebRequest -Uri $pubKeyURL

# Determine the .ssh directory and authorized_keys file path
$sshDir = "$env:USERPROFILE\.ssh"
$authorizedKeysFile = "$sshDir\authorized_keys"
$adminAuthorizedKeysFile = "$env:ProgramData\ssh\administrator_authorized_keys"

# Create the .ssh directory if it does not exist
if(!(Test-Path -Path $sshDir)) {
    New-Item -ItemType Directory -Force -Path $sshDir
}

# Add the public key to the authorized_keys file
Add-Content -Path $authorizedKeysFile -Value $pubKey.Content
Add-Content -Path $adminAuthorizedKeysFile -Value $pubKey.Content

# Correct permissions for the authorized_keys file
icacls.exe $authorizedKeysFile /inheritance:r
icacls.exe $authorizedKeysFile /grant "Administrators:F"
icacls.exe $authorizedKeysFile /grant "$env:USERNAME:F"

# Correct permissions for the administrator_authorized_keys file
icacls.exe $adminAuthorizedKeysFile /inheritance:r
icacls.exe $adminAuthorizedKeysFile /grant "Administrators:F"
icacls.exe $adminAuthorizedKeysFile /grant "SYSTEM:F"


.\YourScriptName.ps1 -gitUser 'otherusername'




