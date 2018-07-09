# Script que cria um Array de servidores
Write-Host
$computadores = @("Server1","Server2","Server3")
$computadores
$soma=$computadores.count
Write-Host Testando todos os $soma Servidores da rede.
sleep 3
Test-Connection $computadores
#FIM
