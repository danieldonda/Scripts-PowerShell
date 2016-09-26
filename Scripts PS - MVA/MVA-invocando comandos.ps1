# invocar um comando como um trabalho em uma sessão remota

Invoke-Command -Session $s -ScriptBlock {
1..100000 | % {"Contando $_"; sleep 1}
} -AsJob -JobName ScriptDemorado

Get-Job -Name ScriptDemorado | Receive-Job -keep



