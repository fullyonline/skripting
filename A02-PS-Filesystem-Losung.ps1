<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A02-PS-Filesystem.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht Dateisystem Funktionen
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
# Lassen Sie sich alle Powershell-Laufwerke des Dateisystems anzeigen.
Get-PSDrive -PSProvider FileSystem
#endregion

#region A2
# a) Legen Sie mit Powershell ein Verzeichnis an.
# b) Erstellen Sie ein neues Powershell-Laufwerk mit Namen Testdaten und dem gerade erstellten Verzeichnis als Stammverzeichnis.
# c) Wechseln Sie in das neue Powershell Laufwerk.

#a)
New-Item -Path C:\Testdaten -ItemType Container

#b)
New-PSDrive -Name Testdaten -PSProvider FileSystem -Root C:\Testdaten

#c)
Set-Location Testdaten:
#endregion

#region A3
# Erstellen Sie im Stammverzeichnis des Laufwerks Testdaten: zwei Dateien:
# a)	Eine neue leere Textdatei mit Namen notiz.txt
# b)	Eine Datei prozesse.txt, die als Inhalt den Namen und die ID der aktuellen Prozesse Ihres Rechners erhält, deren Namen mit s oder w beginnt.

#a)
New-Item -Path .\notiz.txt -ItemType File

#b)
Get-Process -Name s*, w* | Select-Object Name, ID | Set-Content -Path .\prozesse.txt
#endregion

#region A4
# Schreiben Sie in die Datei notiz.txt
# a) Aktuelle Datumsinformation sowie
# b) Die Liste der Dateinamen im Laufwerk Testdaten:

#a)
Add-Content -Path .\notiz.txt -Value (Get-Date)

#b)
Get-ChildItem -Path Testdaten: -Recurse | Add-Content -Path .\notiz.txt
# (Da Sie wissen, dass im Laufwerk nur zwei Dateien vorhanden sind, ist der Parameter -Recurse nicht unbedingt nötig.)
#endregion

#region A5
# Versehen Sie die Datei prozesse.txt mit einem Schreibschutz.
Set-ItemProperty -Path .\prozesse.txt -Name IsReadOnly -Value $true
#endregion

#region A6.	
# Löschen Sie den Inhalt der Datei prozesse.txt
Clear-Content -Path .\prozesse.txt -Force
#endregion

#region A7
# Löschen Sie das virtuelle Powershell-Laufwerk Testdaten: aus der Liste der Powershell-Laufwerke
Set-Location C:
Remove-PSDrive -Name Testdaten -PSProvider FileSystem
# (Die PowerShell kann das aktuelle Laufwerk nicht löschen, daher müssen Sie es zuvor verlassen.)
#endregion
 