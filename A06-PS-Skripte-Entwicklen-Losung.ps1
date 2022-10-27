<#
  .SYNOPSIS
    Hausaufgaben
  .NOTES
    File Name      : A06-PS-Skrips.ps1
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
# Listen Sie den Füllstand aller Dateisystemlaufwerke formatiert auf, 
# verwenden Sie hierfür die WMI-Klasse Win32_Logicaldisk.

# Dieses Script listet den Füllbestand aller Laufwerke
$Computer = "localhost"
$laufwerke = get-wmiobject Win32_LogicalDisk -computer $computer 

" Laufwerk Groesse(MB) Freier Platz(MB)"
ForEach ($laufwerk in $laufwerke)
{
    " {0} {1,15:n} {2,15:n}" -f $laufwerk.DeviceID, ($laufwerk.Size/1MB), $($laufwerk.freespace/1MB)
} 

#endregion


#region A2
# Erstellung einer Datenbank mit der auf mehreren Systemen verfügbaren Software.

# Eingabedatei:
# Das Skript liest aus einer Datei mit Namen Computernamen.txt die Namen bzw. IP-Adressen 
# der abzufragenden Computer aus. Jede Zeile in der Eingabedatei ist ein Computername bzw. eine IP-Adresse.

# Ausgabedatei:
# Eine CSV-Liste mit den Daten der installierten Software (WMI-Klasse win32_product) z.B. softwareinventar.csv

# Besonderheiten:
# Filterung nach Hersteller möglich
Get-Content "computernamen.txt" | 
    ForEach-Object { get-wmiobject win32_product -computername $_ } | 
    Where-Object { $_.vendor -notlike "*Microsoft*" } | 
    export-csv "Softwareinventar.csv" –notypeinformation 

#endregion


#region A3
# Für Informationen über den Computer gibt es kein eigenes Commandlet. 
# Wichtige Informationen über den Computer und das installierte Betriebssystem erhält man mit 
# den WMI-Klassen Win32_Computersystem und Win32_Operatingsystem.

# Listen Sie die Computer und Betriebssystem Informationen.

# Computer Informationen
Get-Wmiobject win32_computersystem

# Betriebssystem Informationen
Get-Wmiobject win32_operatingsystem

#endregion 

#region A4
# Ermitteln Sie analog der obigen Aufgabe die Informationen zu den nachfolgenden Komponenten. 
# Verwenden Sie hierfür die WMI-Klassen Win32_XXXXX.

# - Festplatte
# - Netzwerkadapter
# - Hauptspeicher
# - Grafikkarte
# - Boot Konfiguration
# - BIOS Informationen

# Informationen über die Festplatten
Get-Wmiobject Win32_Diskdrive

# Informationen über den Netzwerkadapter
Get-Wmiobject Win32_NetworkAdapter

# Informationen über den Hauptspeicher
Get-Wmiobject Win32_MemoryDevice

# Informationen über die Grafikkarte
Get-Wmiobject Win32_VideoController

# Startkonfiguration auslesen
Get-Wmiobject Win32_BootConfiguration

# Informationen über das Basic Input/Output System (BIOS)
Get-Wmiobject win32_bios 

#endregion
 

#region A5
# Schreiben Sie ein Skript, welches Sie zur Eingabe des Geburtsdatums auffordert 
# und danach Ihre Alter in Tage, Stunden, Minuten und Sekunden berechnet.

$geburtstag = Read-Host "Wie lautet Ihr Geburtstag (dd.mm.yyyy hh:mm:ss)? :"
$alter = New-TimeSpan $geburtstag

Write-Host "Sie sind " $alter.Days " Tage alt"
Write-Host "Sie sind " $alter.Hours " Stunden alt"
Write-Host "Sie sind " $alter.Minutes " Minuten alt"
Write-Host "Sie sind " $alter.Seconds " Sekunden alt" 

#endregion

#region A6
# Schreiben Sie für die Notendurchschnitt Berechnung ein Script, welches Sie zur Eingabe 
# von Prüfungsnoten auffordert und danach die Durschnittnote ausgibt. 
# Die Aufforderung zur Noteneingabe wird mit der Eingabe von 0 beendet.

$noten = @()
$counter = 1
while(($note = Read-Host -Prompt "$Counter. Note eingeben:") -ne "0") {
    if($note -ge 1 -and $note -le 6) {
        $noten += $note
        $counter++
    }
}

$avg = ($noten | Measure-Object -Average).Average

Write-Host "Notendurchschnitt: " $avg
# "{0:n1}" -f $avg

#endregion


#region A7
# In einer Autovermietung werden – unter anderem – die Mietkosten anhand der gefahrenen km berechnet. 
# Dabei wird wie folgt vorgegangen:
# - Die ersten 200 km werden nicht berechnet,
# - Für die nächsten 800 km werden 0.8 CHF je km berechnet,
# - Darüberhinausgehende km werden mit 0.50 CHF je km berechnet.

# Schreiben Sie ein Programm, das den km-Stand vor Abfahrt und den nach Rückkehr einliest und aus 
# der Differenz nach den obigen Vorgaben die km-Kosten berechnet

$start = Read-Host -Prompt "KM-Stand Start:"
$ende = Read-Host -Prompt "KM-Stand Ende:"

$diff = $ende-$start

$kosten = 0
if($diff -gt 1000) {
    $kosten = ($diff - 1000) * 0.5 + 800 * 0.8
}
elseif($diff -gt 200) {
    $kosten = ($diff - 200) * 0.8
}
else {
    $kosten = 0
}

"Die km-Kosten sind: {0:n2}" -f $kosten
#endregion