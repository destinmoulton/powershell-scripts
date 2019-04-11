$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI"


$DWORDName = "LastLoggedOnUser"

$User = "Patron"
$UserSAM = "$env:computername\$User"
$UserID = "S-1-5-21-312800084-3147437630-2793512582-1002"

New-ItemProperty -Path $registryPath -Name "LastLoggedOnUser" -Value "$UserSAM" `
    -PropertyType String -Force | Out-Null

New-ItemProperty -Path $registryPath -Name "LastLoggedOnSAMUser" -Value "$UserSAM" `
    -PropertyType String -Force | Out-Null

New-ItemProperty -Path $registryPath -Name "LastLoggedOnUserSID" -Value "$UserID" `
    -PropertyType String -Force | Out-Null


# start the time service and sync time
net start w32time
W32tm /resync /force
