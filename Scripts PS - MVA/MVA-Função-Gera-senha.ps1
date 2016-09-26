Function Gera-Senha {
Param ($a)
$Assembly = Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword($a,0)
}