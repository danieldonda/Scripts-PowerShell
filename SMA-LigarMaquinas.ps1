# Comando para ligar maquinas : Start-AzureVM -ServiceName mcsedcsql2012r2 -Name mcsedcsql2012r2
workflow Ligar-VMs
{
#Utiliza a credencial do SMA
$Cred = Get-AutomationPSCredential -Name 'UserSMA'
Add-AzureAccount -Credential $Cred

inlinescript
{
Select-AzureSubscription -SubscriptionName "Windows Azure para Visual Studio Professional com MSDN"
<# Se não usar a lista de VM com o Get-AzureVM tenha certeza que o service name é igual ao nome da VM.
                $VMS = Get-AzureVM 
                foreach($VM in $VMS)
                    {    
                      $VMName = $VM.Name 
                      Start-AzureVM -ServiceName $VM.ServiceName -Name $VM.Name -Force
                      Write-Output "Ligando a VM :  $VMName "
                    } 
         #>
$VMS = ('mcsedcsql2012r2','mcsesccm2012r2')
    foreach($VM in $VMS)
        {    
        Write-Output "Ligando a VM :  $VM "
        Start-AzureVM -ServiceName $VM -Name $VM 
        }


}
}

