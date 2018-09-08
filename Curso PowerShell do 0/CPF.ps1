#CPF
$CPF = Read-Host Qual seu CPF ?
$regex = "/^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}/"



If ($CPF –notmatch $regex) {
  Write-Host "Errou o CPF $CPF" 
  Exit
  }

Write-Host Acertou o CPF !

