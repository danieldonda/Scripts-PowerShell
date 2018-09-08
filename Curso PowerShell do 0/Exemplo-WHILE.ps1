#Exemplo do While

$i = 0
while($true) 
{
$i++
Write-Host "Vou contar até $i"
Sleep 1
if ($i -ge 1000) {break}
}