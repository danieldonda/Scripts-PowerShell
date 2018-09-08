WorkFlow WorkflowDemorado
{
while(1)
    {
    (get-date).ToString() + " Script demoradinho"
    Start-Sleep -Seconds 2
    }
}

$wfjob = WorkflowDemorado -AsJob
$wfjob

Receive-Job $wfjob
Suspend-Job $wfjob -Force
Stop-Job $wfjob 
Resume-Job

