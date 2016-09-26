#Criando uma sessão no servidor
$s = New-PSSession -name install -ComputerName localhost

# executando um comando remoto
Invoke-Command -Session $s -ScriptBlock {
1..1000000 | % {"Contando $_";sleep 1 }
}

# executando um comando remoto como um trabalho
Invoke-Command -Session $s -ScriptBlock {
1..1000000 | % {"Contando $_";sleep 1 }
} -AsJob -JobName LongoTrabalho

Get-Job -Name LongoTrabalho 
Get-Job -Name LongoTrabalho | Receive-Job -Keep

#desconectando da sessão atual
Disconnect-PSSession $s
Get-Job -Name LongoTrabalho 

#reconectando 
Get-PSSession -ComputerName . -Name Install | Connect-PSSession 
$s

Receive-PSSession -Session $s -OutTarget Job -JobName LongoTrabalho
Get-Job LongoTrabalho | Receive-Job -Keep

#criando um trabalho imediatamente desconectado
Invoke-Command -Computer localhost -ScriptBlock {
1..1000000 | % {"Contando $_";sleep 1 }
} -InDisconnectedSession -SessionName Install2
#partiu #cerveja

