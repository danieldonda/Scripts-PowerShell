# Exemplo de sessão persistente usando PSSession, Invoke-Command e Jobs
Clear-Host

#Variavel 
$s = New-PSSession -name 192.168.1.123

Invoke-Command -Session $s -ScriptBlock {

$i = 0
while($true) 
{
$i++
Write-Host "Vou contar até $i"
Sleep 1
if ($i -ge 1000) {break}
}
} -AsJob -JobName LongoTrabalho



#Comandos
Get-Command *PSSEssion
Disconnect-PSSession $s
Receive-PSSession $s 



Get-PSSession | Remove-PSSession
Get-Job -Name LongoTrabalho | Receive-Job  
Get-Job -Name LongoTrabalho | Stop-Job