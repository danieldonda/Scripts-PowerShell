Workflow MeuWorkflow
{
while(1)
    {
    (get-date).ToString() + "Script Demorado"
    Start-Sleep -seconds 3
    }
    }


$wfjob = MeuWorkflow -AsJob
$wfjob
Receive-Job $wfjob 
Suspend-Job $wfjob -Force -Wait
Resume-Job $wfjob 