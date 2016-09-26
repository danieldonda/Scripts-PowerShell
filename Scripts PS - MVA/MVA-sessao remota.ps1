# Criar uma sessão remota
$s = New-PSSession -name remoteserver -ComputerName Posh-SRV1

Get-PSSession
Connect-PSSession $s
Disconnect-PSSession $s

Clear-Host