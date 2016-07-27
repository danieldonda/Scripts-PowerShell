# Instalação do PSWA
Install-WindowsFeature -name WindowsPowerShellWebAccess -ComputerName PoSH-DC1 -IncludeManagementTools
Install-PswaWebApplication -WebApplicationName PSWA -UseTestCertificate
Add-PswaAuthorizationRule -UserName Contoso\administrator -ComputerName Posh-DC1 -ConfigurationName Microsoft.powershell