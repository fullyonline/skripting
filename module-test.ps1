Import-Module D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\TestCmdLet.dll
# schauen ob das Modul Importiert wurde:
Get-Module
# schauen was für Cmdlets wir in diesem Module haben:
Get-Command -Module TestCmdLet

# Help Datei schreiben
# Installation mit Adminrechten!
Install-Module platyps -Force

# Neues Helpfile erzeugen
Import-Module platyps
$OutputFolder = "D:\Serioese_Projekte\Juventus\Module\TestCmdLet\bin\Release\net6.0\"
$parameters = @{
    Module                = "TestCmdLet"
    OutputFolder          = $OutputFolder
    AlphabeticParamsOrder = $true
    WithModulePage        = $true
    ExcludeDontShow       = $true
    Encoding              = [System.Text.Encoding]::UTF8
}
# generiert 2x .md files, welche nur noch bearbeitet werden müssen.
New-MarkdownHelp @parameters
New-MarkdownAboutHelp -OutputFolder $OutputFolder -AboutName "Get_Greeting"

# Update der MAML-Hilfe, nachdem die .md Datein korrekt sind
Update-MarkdownHelpModule -Path $OutputFolder -RefreshModulePage

# Erstellen der .xml-Hilfedatei
New-ExternalHelp -Path $OutputFolder -OutputPath "C:\Windows\System32\WindowsPowerShell\v1.0\Modules\TestCmdLet" -Force

# Preview der Hilfe
Get-HelpPreview -Path "C:\Windows\System32\WindowsPowerShell\v1.0\Modules\TestCmdLet\TestCmdLet.dll-Help.xml"

# Nun packen und hochladen


# Get-Help
Get-Help Get-Greeting

# Greeting holen
"Herbert", "Markus" | Get-Greeting

# Greeting mit Namen holen
$out = Get-Greeting -N "Herbert", "Markus"
$out | Get-Member

# gebe Hilfen aus
$fs = Get-ChildItem C:\Windows\System32\WindowsPowerShell\v1.0\Modules -Recurse 
$fs | Where { $_.Name -like "*dll-Help.xml" } | Select FullName