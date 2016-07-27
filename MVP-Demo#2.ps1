# Muito util na tarefas diarias. Enviar email através de um script.

Send-MailMessage -from danieldonda@msn.com `
                 -SmtpServer smtp.live.com `
                 -UseSsl `
                 -Port 587 `
                 -Credential (Get-Credential danieldonda@msn.com ) `
                 -To danieldonda@msn.com `
                 -Subject "Alerta de gerenciamento" `
                 -Body "E-mail enviado através do PowerShell pelo computador"


# novo recurso PSDefaulParametersValues definirá um em array os valores sempre utilizados.

$PSDefaultParameterValues = @{
"Send-MailMessage:from" = "danieldonda@msn.com";
"Send-MailMessage:SmtpServer"= "smtp.live.com";
"Send-MailMessage:UseSsl"=$true;
"Send-MailMessage:Port"=587;
"Send-MailMessage:Credential" = (Get-Credential danieldonda@msn.com )
}

               
# envio de emails simplicado
Send-MailMessage -to donda@mcsesolution.com -Subject "PowerShell 3.0 !!" -Body "E-mail enviado através do PowerShell pelp computador"


#limpar os pametros salvos
$PSDefaultParameterValues["Disable"] = $true

