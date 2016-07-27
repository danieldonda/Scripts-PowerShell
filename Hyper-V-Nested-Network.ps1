 $VM = 'NanoServer Hyper-v Server'
Set-VMProcessor -VMName $VM -ExposeVirtualizationExtensions $true
Set-VMMemory -VMName $VM -DynamicMemoryEnabled $false
Get-VMNetworkAdapter -VMName $VM | Set-VMNetworkAdapter -MacAddressSpoofing On

#Criar a REDE
$NanoServerName = "NanoHV"
$cred = Get-Credential 'Administrator'
$s = New-PSSession -ComputerName $NanoServerName -Credential $cred
Enter-PSSession -Session $s
$ethernet = Get-NetAdapter -Name ethernet
New-VMSwitch -Name externalSwitch -NetAdapterName $ethernet.Name -AllowManagementOS $true
