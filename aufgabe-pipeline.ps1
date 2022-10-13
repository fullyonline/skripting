<#
  .SYNOPSIS
  Analyse der Syntax
  .NOTES
    File Name      : A05-PS-Pipelining-Ausgabe.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht Cmdlets Pipelining-Ausgabe
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
# Beende durch Aufruf der Methode Kill() alle Prozesse, die „chrome“ heissen, 
# wobei die Gross-/Kleinschreibung des Prozessnamens irrelevant ist.

Get-Process | 
Where-Object { $_.processname -ieq "chrome" } | 
ForEach-Object { $_.Kill() } 

#endregion


#region A2
# Sortiere die Prozesse, die das Wort „chrome“ im Namen tragen, gemäß ihrer CPU-Nutzung 
# und beende den Prozess, der in der aufsteigenden Liste der CPU-Nutzung am weitesten unten 
# steht (also am meisten Rechenleistung verbraucht).

Get-Process | 
Where-Object { $_.processname -ilike "*chrome*" } | 
Sort-Object -property cpu | 
Select-Object -last 1 | 
ForEach-Object { $_.Kill() } 

#endregion


#region A3
# Gib die Summe der Speichernutzung aller Prozesse aus:

Get-Process | 
Measure-Object workingset -Sum

#endregion


#region A4
# Gruppiere die Einträge im System-Ereignisprotokoll nach Benutzernamen.

Get-EventLog -logname system |
Group-Object username 

#endregion


#region A5
# Zeige die letzten zehn Einträge im System-Ereignisprotokoll.

Get-EventLog -logname system | 
Select-Object -last 10 

#endregion


#region A6
# Zeige für die letzten zehn Einträge im System-Ereignisprotokoll die Quelle an.

Get-EventLog -logname system | 
Select-Object -first 10 | 
Select-Object source 

#endregion


#region A7
# Importiere die Textdatei test.txt, wobei die Textdatei als eine CSV-Datei mit 
# dem Semikolon als Trennzeichen zu interpretieren ist und die erste Zeile die 
# Spaltennamen enthalten muss. 
# Zeige daraus die Spalten ID und Url. Die test.txt Datei muss von Ihnen erstellt werden.

Import-Csv d:\_work\test.txt -delimiter “;” | 
Select-Object ID, Url 

#endregion


#region A8
# Ermittle aus dem Verzeichnis System32 alle Dateien, die mit dem Buchstaben „a“ beginnen. 
# Beschränke die Menge auf diejenigen Dateien, die größer als 40000 Byte sind, 
# und gruppiere die Ergebnismenge nach Dateinamenerweiterungen. 
# Sortiere die gruppierte Menge nach dem Namen der Dateierweiterung.

Get-ChildItem c:\windows\system32 -filter a*.* | 
Where-Object { $_.Length -gt 40000 } | 
Group-Object Extension | 
Sort-Object name | 
Format-Table 

#endregion


#region A9
# Ermittle aus dem Verzeichnis System32 alle Dateien, die mit dem Buchstaben „b“ beginnen. 
# Beschränke die Menge auf diejenigen Dateien, die größer als 40000 Byte sind, und gruppiere 
# die Ergebnismenge nach Dateierweiterungen. Sortiere die Gruppen nach der Anzahl der Einträge 
# absteigend und beschränke die Menge auf das oberste Element. 
# Gib für alle Mitglieder dieser Gruppe die Attribute Name und Length aus und passe die Spaltenbreite 
# automatisch an.

Get-ChildItem c:\windows\system32 -filter b*.* | 
Where-Object { $_.Length -gt 40000 } | 
Group-Object Extension | 
Sort-Object count -desc | 
Select-Object -first 1 |
Select-Object group | 
ForEach-Object { $_.group } | 
Select-Object name, length | 
Format-Table -autosize 

#endregion
