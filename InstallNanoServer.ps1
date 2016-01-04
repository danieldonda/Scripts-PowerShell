<#

Script utilizado no vídeo - Introdução ao NanoServer  https://youtu.be/FWpcaGELJ5E 
Neste vídeo eu faço um introdução ao Nano Server do Windows Server 2016, seus benefícios e configurações.
Depois faço uma demonstração de instalação passo a passo e configuração de um servidor Nano Server com IIS, onde mudo as configurações de rede (IP, DNS) e adiciono no domínio.
Esse vídeo também demonstra como fazer o gerenciamento remoto.
⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐

⭐INFO
   • Site: http://www.mcsesolution.com.br
   • Instagram: http://www.instagram.com/danieldondamvp/
   • Twitter: http://twitter.com/danieldonda
   • Fanpage: http://facebook.com/mcsesolution

⭐ INSCREVA-SE NO CANAL 
   • https://youtube.com/DanielDonda
   • Se curtiu o vídeo deixe seu like 
   • Compartilhe o vídeo no Facebook com seus amigos!

⭐ LINKS
   • Download do Windows Server 2016 
     https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-technical-preview?i=1
   • How can we improve Nano Server?
     http://windowsserver.uservoice.com/forums/295068-nano-server

#>


Import-Module d:\nanoserver\NanoServerImageGenerator.psm1


New-NanoServerImage –MediaPath D:\ `
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
$NanoServerName = "NanoServer2"
$cred = Get-Credential 'Administrator'


#Adicionar ao servidor DNS local o registro do Nano Server
Add-DnsServerResourceRecordA -ComputerName WS2012R2 -Name $NanoServerName -ZoneName "Mcsesolution.local" -IPv4Address "192.168.0.41" -PassThru

#### CRIAR UMA SESSAO REMOTA ###
#Adicionar a lista de Hosts confiaveis que poderão ser gerenciandos remotamente.
Set-Item -Path WSMan:\localhost\client\TrustedHosts -Value $NanoServerName -Force

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

#Executar o comando:
djoin /requestodj /loadfile c:\Temp\odjblob /windowspath c:\windows /localos
shutdown /r /t 3
Exit-PSSession
