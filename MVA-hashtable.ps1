# Exemplo de um HashTable
Clear-Host
$servidores = [ordered]@{Server1="10.0.0.1";Server2="10.0.0.2";Server3="10.0.0.3"}
$servidores

$servidores["Server4"] = "10.0.0.4"
$Servidores.Remove("Server4")

$servidores.Server2