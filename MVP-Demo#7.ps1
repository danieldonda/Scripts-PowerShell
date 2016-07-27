# Instalação do PSWA
Install-WindowsFeature –Name WindowsPowerShellWebAccess -ComputerName dc01 -IncludeManagementTools 
Install-PswaWebApplication –webApplicationName PSWA –useTestCertificate 
Add-PswaAuthorizationRule -UserName Contoso\Administrator -ComputerName dc01 -ConfigurationName microsoft.powershell

# Gerenciamento do PSWA
Remove-PswaAuthorizationRule 
Get-PswaAuthorizationRule