<#
  .SYNOPSIS
  Einführung PowerShell Commandlets
  .NOTES
    File Name      : A02-PS-Cmdlets.ps1
    Author         : Lukas Müller
  .DESCRIPTION
  Unterricht Powershell Hilfe
  .PARAMETER
  Keine
  .EXAMPLE
  Keine
  .NOTES
  Keine
  .LINK
  Keine
#> 

#region A1
# Zeigen Sie alle Dienste an, die mit dem Buchstaben s beginnen, 
# aber beendet (stopped) sind.

Get-Service -Name s* | 
    Where-Object { $_.Status -EQ "Stopped" }

Get-Service |
    Where-Object { $_.Status -EQ "Stopped" -and $_.Name -like "s*" }


# oder
Get-Service -Name s* | 
    Where Status -EQ Stopped
#endregion


#region A2
# Sortieren Sie den Verzeichnisinhalt des Windows-Verzeichnisses (nur Dateien) 
# absteigend nach Grösse und exportieren das Ergebnis in die CSV-Datei dateien.csv 
# im aktuellen Verzeichnis.

Get-ChildItem $env:windir -File | 
    Sort-Object -Property Length -Descending | 
    Export-Csv -Path .\dateien.csv


# Desktop Pfad
Get-ChildItem $env:windir -File | 
    Sort-Object -Property Length -Descending | 
    Export-Csv -Path $env:HOMEPATH\desktop\dateien.csv

$desktop = [Environment]::GetFolderPath("Desktop")    
$desktop

#endregion



#region A3

# Es liegen drei Dateien vor: prozesse1.csv, prozesse2.csv und prozesse3.csv. 
# Die Dateien wurden mit folgenden Befehlen erstellt:
# 1. Get-Process | Export-Csv -Path .\prozesse1.csv
# 2. Get-Process | Export-Csv -Path .\prozesse2.csv -Delimiter ";"
# 3. Get-Process | Export-Csv -Path .\prozesse3.csv -UseCulture

# Welche Unterschiede weisen die Dateien 1., 2. und 3. auf?
# Was ist der Unterschied zwischen den Dateien 2. und 3.?

# a) Datei -1- verwendet als Listentrennzeichen das Zeichen ",".
#    Datei -2- verwendet als Listentrennzeichen das Zeichen ";".
#    Datei -3- verwendet als Listentrennzeichen das Zeichen ";" (deutsch).

# b) Im deutschen Sprachraum ist kein Unterschied zu sehen. 
#    Abhängig vom Standard-Listen-trennzeichen können in anderen Kulturen andere Trennzeichen 
#    verwendet werden. Wenn Sie ein bestimmtes Zeichen erzwingen wollen, 
#    verzichten Sie auf den Parameter -UseCulture.
#endregion


#region A4
# Wie viele Dateien mit der Erweiterung .exe (extension) weist Ihr Windows-Verzeichnis auf?
# Wie gross sind diese Dateien insgesamt und durchschnittlich?

Get-ChildItem $env:windir | 
    Where-Object { $_.Extension -EQ ".exe" } | 
	Measure-Object -Property Length -Sum -Average
	
# $env:windir ist die in der PowerShell verwendete Umgebungsvariable für das Windows-Verzeichnis. 
# Sie können natürlich auch C:\Windows verwenden.

# a) Rufen Sie zehnmal die Anwendung notepad.exe auf
1..10 | ForEach-Object { notepad.exe }

# b) Lassen Sie sich die zehn laufenden Prozesse anzeigen und beenden sie dann.
Get-Process -Name notepad | 
    Stop-Process
#endregion


Get-Process | Format-Table ProcessName, Workingset64

