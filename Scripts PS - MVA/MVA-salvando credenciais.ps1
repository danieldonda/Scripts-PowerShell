# Salvando credenciais
Clear-Host
$cred = Get-Credential contoso\administrator

$a = New-PSSession -ComputerName (Get-Content Server.txt) -Credential $cred

Invoke-Command $a { Get-Service }
Get-PSSession

