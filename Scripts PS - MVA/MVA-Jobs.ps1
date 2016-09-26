clear-host

Get-Command -Module PSScheduledJob | Sort-Object Noun

$diario = New-JobTrigger -Daily -at 3am
$umavez = New-JobTrigger -Once -At (Get-Date).AddHours(1)
$semanal = New-JobTrigger -Weekly -DaysOfWeek Monday -At 6pm

Register-ScheduledJob -Name Backup -Trigger $diario -ScriptBlock {Copy-Item C:\Scripts C:\Backup\bkp$((Get-Date).ToFileTime()) -Recurse -Force}

Get-Job

