# Cenário – No Contoso.com, existe um ambiente complexo de servidores e vários administradores. 
# Você como administrador deve permitir que o administrador Junior da empresa possa fazer o gerenciamento remoto de Features ou 
# outros recursos em sua empresa.
# Nota - Através do PowerShell
#Curso de Posh

# Gerenciamento Remmoto - Delegação de Administração
Get-PSSessionConfiguration
$a = New-PSSession -ComputerName Localhost
Invoke-Command { $PSSessionConfigurationName }

#Administrador Junior tenta acessar recursos nessa maquina
$adminjunior = Get-Credential Killing-Floor\admin.junior
$a = New-PSSession -ComputerName Localhost -Credential $adminjunior



#Endpoint para o adin Junior poder conectar
Register-PSSessionConfiguration -Name JuniorEndpoint -ShowSecurityDescriptorUI -Force

$a = New-PSSession -ComputerName Localhost -ConfigurationName JuniorEndPoint -Credential $adminjunior
Invoke-Command $a { Get-Command }

Invoke-Command $a { Get-Service }

# Não podese acessar os serviços. Como resolver ? Com credenciais de adminitrador
Set-PSSessionConfiguration -Name JuniorEndPoint -RunAsCredential Killing-Floor\administrator -Force
$a = New-PSSession -ComputerName Localhost -ConfigurationName JuniorEndPoint -Credential $adminjunior
Invoke-Command $a { Get-Service }

Invoke-Command $a { $PSSenderInfo }
Unregister-PSSessionConfiguration -Name JuniorEndPoint -Force
# -------------------------------------------------------- #

# Criando um arquivo de EndPoint com recursos de controle administrativo.
New-PSSessionConfigurationFile -Path c:\Endpoint.pssc -ModulesToImport Microsoft.PowerShell.Management -VisibleCmdlets Get-Service -SessionType RestrictedRemoteServer
ise C:\Endpoint.pssc

# Registrar o Endpoint.pssc
Register-PSSessionConfiguration -Name JuniorEndPoint -Path C:\Endpoint.pssc -RunAsCredential Killing-Floor\administrator -ShowSecurityDescriptorUI -Force

# Vamos logar novamente coo admin Junior.
$a = New-PSSession -ComputerName Localhost -ConfigurationName JuniorEndPoint -Credential $adminjunior



Invoke-Command $a { Get-Service }
Invoke-Command $a { Get-Command }
