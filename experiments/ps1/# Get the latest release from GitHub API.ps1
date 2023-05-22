# Get the latest release from GitHub API
$apiUrl = "https://api.github.com/repos/PowerShell/Win32-OpenSSH/releases/latest"
$latestRelease = Invoke-RestMethod -Uri $apiUrl

# Get the MSI asset for x64
$msiAsset = $latestRelease.assets | Where-Object { $_.name -like "*x64.msi" }

# Get the download URL
$downloadUrl = $msiAsset.browser_download_url

# Download the file
Invoke-WebRequest -Uri $downloadUrl -OutFile $msiAsset.name


# Set registry key to accept EULA for Sysinternals tools
Set-ItemProperty -Path "HKCU:\Software\Sysinternals" -Name "EulaAccepted" -Value 1

# Define registry path
$registryPath = "HKCU:\Software\Sysinternals"

# Backup registry key
if(Test-Path -Path $registryPath) {
    # Export the registry key to a .reg file
    # Replace "C:\path\to\backup.reg" with your desired backup file location
    reg export $registryPath "C:\path\to\backup.reg" /y
} else {
    Write-Host "The specified registry key does not exist."
}

# Ensure registry key exists
if(!(Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Define registry path
$registryPath = "HKCU:\Software\Sysinternals"

# Backup registry key
if(Test-Path -Path $registryPath) {
    # Export the registry key to a .reg file
    # Replace "C:\path\to\backup.reg" with your desired backup file location
    reg export $registryPath "C:\path\to\backup.reg" /y
} else {
    Write-Host "The specified registry key does not exist."
}

# Ensure registry key exists
if(!(Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set registry key to accept EULA for Sysinternals tools
Set-ItemProperty -Path $registryPath -Name "EulaAccepted" -Value 1


Autologon64.exe Administrator . somepw
# Run this script in PowerShell with administrative privileges

# Define the path to add
$pathToAdd = 'C:\Path\To\Add' # Replace this with the path you want to add

# Get the current system PATH
$currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')

# Check if the path is already in the system PATH
if ($currentPath -notlike "*$pathToAdd*") {
    # Add the new path to the system PATH
    $newPath = $currentPath + ';' + $pathToAdd
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
} else {
    Write-Host "The specified path is already in the system PATH."
}

# Run this script in PowerShell

param (
    [Parameter(Mandatory=$false)][string]$key,
    [Parameter(Mandatory=$false)][string]$keyFile
)

# Determine the .ssh directory and authorized_keys file path
$sshDir = "$env:USERPROFILE\.ssh"
$authorizedKeysFile = "$sshDir\authorized_keys"

# Create the .ssh directory if it does not exist
if(!(Test-Path -Path $sshDir)) {
    New-Item -ItemType Directory -Force -Path $sshDir
}

# If a key file is specified, read the key from the file
if($keyFile) {
    $key = Get-Content -Path $keyFile
}

# If a key is specified, add it to the authorized_keys file if it is not already present
if($key) {
    # Create the authorized_keys file if it does not exist
    if(!(Test-Path -Path $authorizedKeysFile)) {
        New-Item -ItemType File -Force -Path $authorizedKeysFile | Out-Null
    }
    
    # Get the current authorized keys
    $currentKeys = Get-Content -Path $authorizedKeysFile

    # Add the key if it is not already present
    if($currentKeys -notcontains $key) {
        Add-Content -Path $authorizedKeysFile -Value $key
    } else {
        Write-Host "The specified key is already in the authorized_keys file."
    }
} else {
    Write-Host "No key specified. Please specify a key or a key file."
}
.\YourScriptName.ps1 -key 'ssh-rsa AAAAB3NzaC1yc...'
.\YourScriptName.ps1 -keyFile 'C:\path\to\keyfile.pub'



