Get-NetIPAddress 
Get-NetIPInterface -e
New-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1
New-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.1 -PrefixLength 24 -DefaultGateway 192.168.0.5


Set-NetIPInterface –InterfaceIndex 12 –Dhcp Enabled
Set-NetIPInterface –InterfaceIndex 12 –Dhcp Disabled
Get-NetAdapter -Name Ethernet
Get-NetAdapter -Name Ethernet |
Rename-NetAdapter -Name Ethernet -NewName "Rede Ethernet"
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 192.168.0.1

Get-NetAdapter -Name vethernet* | 
Disable-NetAdapter -name Ethernet
