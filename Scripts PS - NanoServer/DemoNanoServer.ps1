#DEMO NANO SERVER BASIC
#Ok

Import-Module E:\nanoserver\NanoServerImageGenerator.psm1 -Verbose
New-NanoServerImage –MediaPath E:\ `
    -BasePath C:\NanoServer `
    -TargetPath C:\NanoServer\NanoServer4.VHD `
    –ComputerName “NanoServerDemo” `
    -Package Microsoft-NanoServer-IIS-Package `
    -Language en-us `
    -ReverseForwarders `
    -AdministratorPassword (ConvertTo-SecureString -String ‘P@ssw0rd’ -AsPlainText -Force)


#Variaveis
$NanoServerName = "NanoServerdemo"
$cred = Get-Credential 'Administrator'
#Firewall


#CRIAR NANOSERVER COM REDE
New-NanoServerImage –MediaPath F:\ `
    -BasePath C:\NanoServer `
    -TargetPath C:\NanoServer\NanoServerDemo.VHD `
    –ComputerName “NanoServerDemo” `
    -Guestdrivers `
    -Ipv4Address 192.168.0.45 `
    -Ipv4SubnetMask 255.255.255.0 `
    -Ipv4Gateway 192.168.0.1 `
    -Package Microsoft-NanoServer-IIS-Package `
    -Language en-us `
    -AdministratorPassword (ConvertTo-SecureString -String ‘P@ssw0rd’ -AsPlainText -Force)



#Adicionar ao servidor DNS local o registro do Nano Server
Add-DnsServerResourceRecordA -ComputerName WS2012R2 -Name $NanoServerName -ZoneName "Mcsesolution.local" -IPv4Address "192.168.0.45" -PassThru

#### CRIAR UMA SESSAO REMOTA ###
#Adicionar a lista de Hosts confiaveis que poderão ser gerenciandos remotamente.
Set-Item -Path WSMan:\localhost\client\TrustedHosts -Value $NanoServerName -Force

#criar uma sessão
$s = New-PSSession -ComputerName $NanoServerName -Credential $cred

Enter-PSSession -VMName NanoServerDemo 


#Entrar em uma sessão remota
Enter-PSSession -Session $s
Exit-PSSession

#### ADICIONAR DNS ###
#Adicionar o DNS
$placaderede = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
$placaderede | Set-DnsClientServerAddress -ServerAddresses "192.168.0.200"

find-packageprovider
find-package -Providername nuget -Source http://www.nuget.org/api/v2
Install-Package node.js -DestinationPath c:\node -Providername nuget -Source http://www.nuget.org/api/v2

#Rodando Node.js

'console.log("Hello World - NanoServer Rocks");' | Out-File -Encoding ascii hello.js
.\node.exe hello.js


#### COPIAR RECURSOS COM O PS  ###
#Copiar Item 
Copy-Item -ToSession $s -Path C:\WebServer\*.* -Destination c:\inetpub\wwwroot
Copy-Item -ToSession $s -Path C:\NanoServer\odjblob -Destination c:\temp

#### ADICIONAR AO DOMINIO ###
    #Adicionar Nano Server no dominio (Offline)
    djoin.exe /provision /domain mcsesolution.local /machine $NanoServerName /savefile .\odjblob

    #Executar o comando:
    djoin /requestodj /loadfile c:\Temp\odjblob /windowspath c:\windows /localos
    shutdown /r /t 3
    Exit-PSSession
