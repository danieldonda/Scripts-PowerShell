#  Como Instalar um server com suporte a Container no NanoServer - TP5 #

Import-Module G:\NanoServer\NanoServerImageGenerator\NanoServerImageGenerator.psm1

New-NanoServerImage -EnableRemoteManagementPort `
    –MediaPath G:\ `
    -TargetPath C:\NanoServer\NanoSRVDocker.VHDX `
    –ComputerName “NanoDocker” `
    -DomainName mcsesolution.local `
    -DeploymentType Guest ` `
    -Edition Standard `
    -InterfaceNameorIndex "Ethernet" `
    -Ipv4Address "192.168.0.50" `
    -Ipv4SubnetMask "255.255.255.0" `
    -Ipv4Dns "192.168.0.200" `
    -Ipv4Gateway "192.168.0.1" `
    -Package Microsoft-NanoServer-Containers-Package `
     -AdministratorPassword (ConvertTo-SecureString -String ‘P@ssw0rd’ -AsPlainText -Force)





    
$NanoServerName = "NanoHV"
$cred = Get-Credential 'Administrator'

#Iniciar uma sessão remota e copiar o VHD recém criado
$s = New-PSSession -ComputerName $NanoServerName -Credential $cred
Copy-Item -ToSession $s -Path "C:\NanoServer\NanoSRVDocker.vhdx" -Destination "C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks"
