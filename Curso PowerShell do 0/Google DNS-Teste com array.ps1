# Script que usa Array
Clear-Host 
$GoogleDNS = @("8.8.8.8", "8.8.4.4")
$TotalDNS = $GoogleDNS.Count
Write-Host Pingando todos os $TotalDNS DNS do Google
Test-Connection $GoogleDNS -Count 1
sleep 3
Write-Host FIM!