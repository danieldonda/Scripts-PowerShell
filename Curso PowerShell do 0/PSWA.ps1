# Instalação do PSWA

Install-WindowsFeature -name WindowsPowerShellWebAccess -ComputerName  -IncludeManagementTools
#Uninstall-WindowsFeature -Name WindowsPowerShellWebAccess

Install-PswaWebApplication -WebApplicationName PSWA -UseTestCertificate
# Uninstall-PswaWebApplication -WebApplicationName PSWA

Add-PswaAuthorizationRule -ComputerGroupName * -configurationName * -UserGroupName * 
Get-PswaAuthorizationRule
#Remove-PswaAuthorizationRule -Id 0