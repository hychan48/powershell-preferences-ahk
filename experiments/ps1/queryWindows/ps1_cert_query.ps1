# Retrieve certificates from certmgr.msc
# $certificates = Get-ChildItem -Path Cert:\LocalMachine\My
# all certificates
<#
CurrentUser: Cert:\CurrentUser\My
Personal: Cert:\LocalMachine\My
Trusted Root Certification Authorities: Cert:\LocalMachine\Root
Intermediate Certification Authorities: Cert:\LocalMachine\CA
 #>

 # should grep for local desktop stuff?
 # maybe empty because not admin
 # > scratch.log.jsonc
 $certificates = Get-ChildItem -Path Cert:\CurrentUser\My -Recurse
 $certificates = Get-ChildItem -Path Cert:\CurrentUser\My\Root -Recurse # empty
 $certificates = Get-ChildItem -Path Cert:\CurrentUser\My\CA -Recurse # empty
 
 $certificates = Get-ChildItem -Path Cert:\LocalMachine\My -Recurse
 $certificates = Get-ChildItem -Path Cert:\LocalMachine\My\Root -Recurse # empty
 $certificates = Get-ChildItem -Path Cert:\LocalMachine\My\CA -Recurse # empty
 
 # Create an array to store certificate information
 $certificateInfo = @()
 
 # Iterate through each certificate and extract basic information
 foreach ($certificate in $certificates) {
     $certificateData = [PSCustomObject]@{
         Subject       = $certificate.Subject
         Thumbprint    = $certificate.Thumbprint
         Issuer        = $certificate.Issuer
         ValidFrom     = $certificate.NotBefore
         ValidTo       = $certificate.NotAfter
         FriendlyName  = $certificate.FriendlyName
         SerialNumber  = $certificate.SerialNumber
         StoreLocation = $certificate.PSParentPath
     }
 
     # Add certificate information to the array
     $certificateInfo += $certificateData
 }
 
 # Convert the certificate information to JSON format
 $jsonData = ConvertTo-Json -InputObject $certificateInfo -Depth 4
 
 # Output the JSON data
 $jsonData
