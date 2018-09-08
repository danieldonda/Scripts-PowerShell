(Get-Command –Module ActiveDirectory).count 



Get-ADUser daniel.donda -Properties *
| Enable-ADAccount
Get-ADUser -Filter * | where {$_.enabled -eq $false} | Enable-ADAccount

Get-Command New-AD*
get-aduser cursoposh | Remove-ADUser
New-Aduser -Name CursoPOSH 