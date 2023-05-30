function Test-IsAdmin {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $principal = New-Object Security.Principal.WindowsPrincipal($user);
    $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}

if (Test-IsAdmin) {
    Write-Host "Running with admin privileges."
} else {
    Write-Host "Not running with admin privileges."
}