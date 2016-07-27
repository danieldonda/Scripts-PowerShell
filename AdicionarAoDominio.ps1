
<#
Script que adiciona a maquina no dominio.  
Pode ser melhorado com variaveis.
#>

$credential = New-Object System.Management.Automation.PsCredential("contoso\administrator", (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force))
Add-Computer -DomainName "contoso.com" -Credential $credential 