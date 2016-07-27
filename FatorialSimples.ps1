param([string]$tamanho)

$frase = 'amoreco'
$tamanho = $frase.length
Write-Output "A palavra ou frase $frase tem o tamanho $tamanho"



function fatorial([int]$x)  
{  
    if ($x -eq 1)  
        { return 1 }  
    else  
        { return $x * (fatorial ($x - 1)) }  
}  
  

$resultado=fatorial $tamanho
Write-Output "E permite a quantidade de $resultado combinações"
