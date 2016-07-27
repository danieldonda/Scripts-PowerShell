#Agendamento de tarefas
Get-Command -Module PSScheduledJob | Sort-Object Noun

Get-Command New-JobTrigger -Syntax

$diario = New-JobTrigger -Daily -at 3am
$umavez = New-JobTrigger -Once -At (Get-Date).AddHours(1)
$semanal = New-JobTrigger -Weekly -DaysOfWeek Monday -At 6pm

Register-ScheduledJob -Name BackupDiario -Trigger $diario -ScriptBlock {Copy-Item C:\scripts f:\backup\bkp$((Get-Date).ToFileTime()) -Recurse -Force}
 
Register-ScheduledJob -Name RelatorioSemanal -Trigger $semanal -FilePath C:\scripts\Odata\View-OData.ps1

Get-ScheduledJob
Get-ScheduledJob TrabalhoAgendado | Get-JobTrigger
Get-ScheduledJob TrabalhoAgendado | Unregister-ScheduledJob
Get-ScheduledJobOption -Name Trabalho

Get-Job
Receive-Job

