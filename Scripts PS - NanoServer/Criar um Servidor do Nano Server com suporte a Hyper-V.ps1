import-Module G:\NanoServer\NanoServerImageGenerator\NanoServerImageGenerator.psm1
New-NanoServerImage -EnableRemoteManagementPort `
 –MediaPath G:\ `
 -TargetPath C:\NanoServer\NanoSRVHV.VHDX `
 –ComputerName “NanoHV” `
 -DomainName mcsesolution.local `
 -DeploymentType Guest ` `
 -Edition Standard `
 -InterfaceNameorIndex "Ethernet" `
 -Ipv4Address "192.168.0.207" `
 -Ipv4SubnetMask "255.255.255.0" `
 -Ipv4Dns "192.168.0.200" `
 -Ipv4Gateway "192.168.0.1" `
 -Package Microsoft-NanoServer-Compute-Package `
 -AdministratorPassword (ConvertTo-SecureString -String ‘P@ssw0rd’ -AsPlainText -Force)

