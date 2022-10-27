<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A08-PS-Fehlerbehandlung.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht Funktionen
  .PARAMETER
  Keine
  .EXAMPLE
  Keine
  .NOTES
  Keine
  .LINK
  Keine
#> 

#region
# Collapse all regions use CTRL-M
#endregion


#region A1
# Über die globale eingebaute Variable $ErrorActionPreference kann man das 
# Standardverhalten für -ErrorAction für alle Commandlets setzen. 
# Der Wert muss als Zeichenkette übergeben werden. 
# Die Standardeinstellung ist «Continue». 
# Untersuchen Sie die Programmausführung und Fehlermeldung (Standardverhalten) bei folgenden Einstellungen.
# -	Verhalten bei $ErrorActionPreference="Continue"
# -	Verhalten bei $ErrorActionPreference="SilentlyContinue"
#-	Verhalten bei $ErrorActionPreference="Stop"

# Fehler auslösen
Write-Host (1 / $null) 

"Regulärer Programmstart"

"Aktueller Fehlerbehandlungsstandard: $ErrorActionPreference"

"1. Versuch"
# Fehler auslösen
Write-Host (1 / $null)

"2. Versuch"
$ErrorActionPreference = "silentlycontinue"

# Fehler machen
write-host (1 / $null)

"3. Versuch"
# Fehler machen
$ErrorActionPreference = “stop”
write-host (1 / $null)

“Reguläres Programmende” 
#endregion


#region A2
# Programmieren Sie in Ihrer Skriptdatei mehrere Powershell Befehle und prüfen Sie nach jedem Befehl 
# die $? Systemvariable. 
# Testen Sie den Inhalt dieser Variable bei erfolgreichen und fehlerhaften Befehlen. 
# Untersuchen Sie zudem den Inhalt der Variable $error[0]

Get-Content gibtsnicht.txt
$?
$error[0]

Get-Content C:\Windows\system.ini
$? 
#endregion


#region A3
# Um nicht jeden Fehler separat überprüfen zu müssen, lässt die Powershell abschnittweise Fehlerüberprüfungen 
# mit try catch zu. Im catch Block kann an zentraler Stelle eine Fehlerbehandlung hinterlegen werden.
# Programmieren Sie eine Skript Datei, in welcher Sie mehrere Cmdlet in den try-Block einfügen und im catch-Block 
# eine Fehlerbehandlung vornehmen. 
# Geben Sie im catch-Block auch die Fehlermeldung aus.
# Achten Sie, dass vor dem try-Block die Variable $ErrorActionPreference = "Stop" gesetzt werden muss, 
# da ansonsten der catch-Block nicht ausgeführt wird.

$ErrorActionPreference = "Stop"
try 
{
    Get-Content gibtsnicht.txt
}
catch
{
    "Fehler: " + $error[0]
} 

#endregion

