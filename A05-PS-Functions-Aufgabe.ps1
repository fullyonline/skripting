<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A05-PS-Functions.ps1
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
# Erstellen Sie die Funktion Get-MyProcess, die Prozesse auf Ihrem lokalen Rechner 
# unter folgenden Bedingungen anzeigt.
# -	Die anzuzeigenden Prozesse beginnen mit dem Buchstaben s
# -	Die Spalten ID, ProcessName und CPU sollen angezeigt werden
# -	Die Anzeige soll absteigend nach der Eigenschaft CPU sortiert werden.

function Get-MyProcess() {
  Get-Process -Name s* | Select-Object -Property ID, ProcessName, CPU | Sort-Object { $_.CPU } -Descending
}

Get-MyProcess;

#endregion

#region A2	
# Kopieren Sie die Funktion Get-MyProcess und fügen Sie sie unter dem 
# Namen Get-MyProcess2 in Ihr Skript ein. 
# Wandeln Sie die Funktion wie folgt ab.
#  - Die Funktion soll einen Parameter $FilterName akzeptieren, der bestimmt, 
#    welche Prozesse angezeigt werden. 
#    Standardwert: Es sollen Prozesse angezeigt werden, deren Name mit dem 
#                  Buchstaben s beginnt.
#  - Über einen Switch-Parameter $Liste soll gesteuert werden, die Ausgabe 
#    als Liste zu sehen (Format-List) und nicht als Tabelle.


function Get-MyProcess2([string]$FilterName = "s*", [switch]$Liste) {
  if ($Liste) {
    Get-Process -Name $FilterName | Select-Object -Property ID, ProcessName, CPU | Sort-Object { $_.CPU } -Descending | Format-List
  }
  else {
    Get-Process -Name $FilterName | Select-Object -Property ID, ProcessName, CPU | Sort-Object { $_.CPU } -Descending
  }
}

Get-MyProcess2 "a*";
Get-MyProcess2 "a*" -Liste;

#endregion

#region A3
# Kopieren Sie die Funktion Get-MyProcess2 und fügen Sie sie unter dem Namen Get-MyProcess3 
# in Ihr Skript ein. 
# Wandeln Sie die Funktion wie folgt ab.
# - Entfernen Sie die Programmierung des Switch-Parameters $Liste.
# -	Erstellen Sie stattessen einen Filter Name=Liste, der die Aufgabe übernimmt, übergebene 
#   Objekte als Liste darzustellen.
# Speichern Sie Ihr Skript, führen Sie es erneut aus und testen Sie die abgeänderte Funktion 
# zusammen mit dem definierten Filter

filter Liste {
  $_ | Format-List
}

function Get-MyProcess3([string]$FilterName = "s*") {
  Get-Process -Name $FilterName | Select-Object -Property ID, ProcessName, CPU | Sort-Object { $_.CPU } -Descending
}

Get-MyProcess3 "a*" | Liste;

 
#endregion

#region A4
# Erstellen Sie eine Funktion Get-Error, welche das Ereignisprotokoll (EventsLog) vom letzten 
# Tag auflistet. 
# Dabei gelten folgende Vorgaben:
# -	Das gewünschte Ereignisprotokoll (System, Application etc.) muss als Parameter der Funktion 
#   übergeben werden.
# -	Das Argument «Ereignisprotokoll» muss als Pflichtparameter sein.

function Get-Error([Parameter(Mandatory = $true)]$LogName) {
  Get-EventLog -EntryType Error -LogName $LogName -After (Get-Date).AddDays(-1)
}

Get-Error -LogName "Appli*"

#endregion

#region A5
# Erstellen Sie in Ihrem Skript eine Funktion Optimize-Output, die Objekte des Befehls Get-Process 
# über die Pipeline verarbeiten kann. 
# Richten Sie sich nach folgenden Vorgaben:
# -	Vor der Verarbeitung soll das aktuelle Datum ausgegeben werden.
# -	Für die Verarbeitung der Objekte über die Pipeline übernehmen Sie die Auswahl der Eigenschaften 
#   und die Sortierung aus den bereits erstellen Funktionen des Skripts.
# -	Nach der Verarbeitung soll die Meldung «Aufgabe erledigt» in schwarzer Schrift auf weissem 
#   Hintergrund ausgegeben werden.

function Optimize-Output {
  begin {
    Get-Date
  }
  process {
    $_ | Select-Object -Property ID, ProcessName, CPU | Sort-Object { $_.CPU } -Descending
  }
  end {
    Write-Host "Aufgabe erledigt" -ForegroundColor Black -BackgroundColor White
  }
}

Get-Process | Optimize-Output

#endregion

#region A6
# Erstellen Sie ein Filter NewFiles. 
# Dieser Filter erwartet $tage als Parameter und selektiert die über die Pipleline empfangene Objekte (Dateien). 
# Dabei gelten folgende Vorgaben:
# -	Ermitteln Sie die Anzahl Tage der letzten Änderung am Objekt (Differenz aktuellen Datum und Datum der 
#   letzten Änderung).
# -	Falls dieser Wert kleiner als die im Filteraufruf eingegebene Anzahl Tage ist, wird das Objekt durch 
#   den Filter gelassen und angezeigt.


Filter NewFiles([int]$tage) {
  begin {
    $datum = Get-Date
  }
  process {
    $_ |
    Where-Object { ($datum - $_.LastWriteTime).Days -lt $tage }
  }
}


Get-ChildItem C:\Windows | NewFiles 10

#endregion

#region A7
# Erstellen Sie eine kurze Dokumentation über die Funktion Get-MyProcess2 und fügen Sie 
# diese der Funktionsdefinition im Script hinzu. 
# Rufen Sie anschliessend mit Get-Help Get-MyProcess2 den Hilfetext dieser Funktion auf.



#endregion

#region A8
# Sie möchten die obigen Funktionen Get-MyProcess etc. auch aus anderen Skriptdateien aufrufen können. 
# Erstellen Sie hierfür eine neue Skript Datei MyFunctions.ps1 und fügen Sie alle Funktionen in diese 
# Datei ein (Funktionsbibliothek). 
# Nun erstellen Sie eine neue Skript Datei und binden in diese mit Dot-Sourcing (zusätzlich vorangestellten Punkt) 
# die Funktionsbibliothek ein und prüfen Sie anschliessend die Ausführung der einzelnen Funktionen.


#endregion
