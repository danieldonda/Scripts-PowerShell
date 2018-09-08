function iniciar-editores
{
Start-Process Notepad
sleep 5
Start-Process Wordpad
}

workflow start-editores
{
Parallel {
Start-Process Notepad
sleep 5
Start-Process Wordpad
}
}