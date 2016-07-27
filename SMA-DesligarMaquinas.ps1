workflow Desligar-VMs
{

 #Utiliza a credencial do SMA
$Cred = Get-AutomationPSCredential -Name 'UserSMA'
Add-AzureAccount -Credential $Cred

inlinescript
{
#Seleciona a Assinatura
Select-AzureSubscription -SubscriptionName "Windows Azure para Visual Studio Professional com MSDN"
#Gera lista de VMs
$VMS = Get-AzureVM 
#Derruba todas as VMs
    foreach($VM in $VMS)
        {    
        $VMName = $VM.Name 
        Stop-AzureVM -ServiceName $VM.ServiceName -Name $VM.Name -Force
        Write-Output "Desligando a VM :  $VMName "
        }
}
}