Clear-Host
$cred = Get-Credential mcsesolution\administrator 
$rede = New-PSSession -ComputerName (Get-Content C:\SCRIPTS\servers.txt) -Credential $cred

Invoke-Command $rede { Get-Service }
