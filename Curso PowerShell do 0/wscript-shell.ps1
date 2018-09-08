$wshell = New-Object -ComObject WScript.Shell

$wshell | Get-Member


$wshell.Popup("Esse curso eh muito legal")

$wshell.Run("Notepad")
$wshell.AppActivate("Notepad")
Start-Sleep 1
$wshell.SendKeys("Esse curso eh muito legal")