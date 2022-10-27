<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A01-PS-StartArgs.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht Skripte mit Start Argumente aufrufen
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
# Erstellen Sie eine neue Skript Datei StartArgs.ps1. 
# Beim Aufruf dieser Skript Datei müssen drei IP-Adressen übergeben werden, 
# die im Skript eingelesen und ausgegeben werden. Prüfen Sie auch die Anzahl 
# die übergebenen Parameter.

# a) Implementieren Sie die Variante mit $args Array.
# b) Ändern Sie die Skript Datei durch die Variante mit einer expliziten Parameter Deklaration.

# Skript mit Parametern
# .\StartArgs.ps1 Parameter1 Parameter2 Parameter3
# ohne Klammern und getrennt durch Leerzeichen

# a)
<#
if ($args.Count -ne 3)
{
    "Ungültige Anzahl der Input Parameter. Anzahl=" + $args.Count
}
else
{
    "Anzahl der Start Argumente:" + $args.Count
    for ( $i = 0; $i -lt $args.count; $i++ ) 
    {
        $args[$i]
    } 
}
#>



# b)
# Skript mit Parametern
# .\StartArgs.ps1 Parameter1 Parameter2 Parameter3
# ohne Klammern und getrennt durch Leerzeichen
param([string] $IP1, [string] $IP2, [string] $IP3)

# Ausgabe
$IP1
$IP2
$IP3
#endregion
