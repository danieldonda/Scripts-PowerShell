Import-Module f:\nanoserver\NanoServerImageGenerator.psm1
Edit-NanoServerImage -BasePath C:\NanoServer -TargetPath C:\NanoServer\NanoServer3.VHD -Packages Microsoft-NanoServer-IIS-Package, Microsoft-NanoServer-Containers-Package 

New-NanoServerImage –MediaPath F:\ `
    -BasePath C:\NanoServer `
    -TargetPath C:\NanoServer\NanoServer2.VHD `
    –ComputerName “NanoServer2” `
    -Guestdrivers `
    -Ipv4Address 192.168.0.41 `
    -Ipv4SubnetMask 255.255.255.0 `
    -Ipv4Gateway 192.168.0.1 `
    -Package Microsoft-NanoServer-IIS-Package `
    -Language en-us `
    -AdministratorPassword (ConvertTo-SecureString -String ‘P@ssw0rd’ -AsPlainText -Force)

    
#Variaveis
$NanoServerName = "NanoServerDemo"
$nanoip = "192.168.0.40"
$cred = Get-Credential 'Administrator'


#Adicionar ao servidor DNS local o registro do Nano Server
Add-DnsServerResourceRecordA -ComputerName WS2012R2 -Name $NanoServerName -ZoneName "Mcsesolution.local" -IPv4Address "192.168.0.41" -PassThru

#### CRIAR UMA SESSAO REMOTA ###
#Adicionar a lista de Hosts confiaveis que poderão ser gerenciandos remotamente.
Set-Item -Path WSMan:\localhost\client\TrustedHosts -Value $NanoServerName -Force
Get-Item WSMan:\localhost\Client\TrustedHosts
# Set-Item WSMan:\localhost\Client\TrustedHosts -Value xxx.xxx.xxx.xxx

#criar uma sessão
$s = New-PSSession -ComputerName $NanoServerName -Credential $cred

#Entrar em uma sessão remota
Enter-PSSession -Session $s
Exit-PSSession

#### ADICIONAR DNS ###
#Adicionar o DNS
$placaderede = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
$placaderede | Set-DnsClientServerAddress -ServerAddresses "192.168.0.200"

#### COPIAR RECURSOS COM O PS  ###
#Copiar Item 
Copy-Item -ToSession $s -Path C:\WebServer\*.* -Destination c:\inetpub\wwwroot
Copy-Item -ToSession $s -Path C:\NanoServer\odjblob -Destination c:\temp

#### ADICIONAR AO DOMINIO ###
#Adicionar Nano Server no dominio (Offline)
djoin.exe /provision /domain mcsesolution.local /machine $NanoServerName /savefile .\odjblob


#Install MYSQL
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes


#Executar o comando:
djoin /requestodj /loadfile c:\Temp\odjblob /windowspath c:\windows /localos
shutdown /r /t 3
Exit-PSSession


Find-NanoServerPackage