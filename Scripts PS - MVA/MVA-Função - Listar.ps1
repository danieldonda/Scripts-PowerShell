Function Listar 
{
Get-WmiObject Win32_diskPartition | Select-Object Name, VolumeName, DiskIndex
}
