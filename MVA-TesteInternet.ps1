# teste de Internet
Clear-Host
$con = (Test-Connection www.bing.com -Quiet)
if ($con -eq "true") {Write-Host "Internet Funcionando"}
