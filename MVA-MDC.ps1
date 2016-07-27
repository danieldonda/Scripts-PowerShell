# Algoritmo de Euclides
# M.D.C
#-------------------
Clear-Host
$a = Read-Host "Valor 1"
$b = Read-Host "Valor 2"


while ($b -ne 0)
{
$x = $b
$b = $a%=$x
$a=$x
}
Write-Host $x é o MDC 

