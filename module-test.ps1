Import-Module D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Debug\net6.0\TestCmdLet.dll
# schauen ob das Modul Importiert wurde:
Get-Module
# schauen was für Cmdlets wir in diesem Module haben:
Get-Command -Module TestCmdLet

# Greeting holen
Get-Greeting

# Greeting mit Namen holen
Get-Greeting -Name "Thomas"