# Set Powershell to Administrator
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

# Get IP and Gateway
$IP = Read-Host -Prompt "IP Address"
$GATEWAY = Read-Host -Prompt "Gateway"

# Set the IP Address
New-NetIPAddress –InterfaceAlias "Ethernet" –IPAddress $IP –PrefixLength 24 -DefaultGateway $GATEWAY

# Set the DNS Servers to CloudFlare (ultra fast)
Set-DnsClientServerAddress -InterfaceAlias “Ethernet” -ServerAddresses 1.1.1.1, 1.0.0.1

Get-NetIPConfiguration
Read-Host "Press Enter to exit..."
exit