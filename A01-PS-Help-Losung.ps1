<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A01-PS-Help.ps1
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

#region
# Collapse all regions use CTRL-M
#endregion

#region A1
# Führen Sie die Update-Help auf Ihrem System aus. 
# Wie lautet das vollständige Cmdlet, da die deutschsprachige Hilfe nicht zur Verfügung steht.

Update-Help –UICulture en-US

#endregion

#region A2
# Rufen Sie die Hilfe für das Cmdlet Get-Service auf. 
# Vergleichen Sie die Ausgabe, wenn Sie keine weiteren Parameter angeben mit der Ausgabe, 
# die Sie jeweils bei zusätzlicher Eingabe es Parameters -Detailed, -Full bzw. -Examples erhalten.

Get-Help -Name Get-Service
Get-Help -Name Get-Service -Detailed
Get-Help -Name Get-Service -Full
Get-Help -Name Get-Service -Examples

#endregion

#region A3
# Finden Sie heraus, welche Cmdlet den Parameter -Verb verwenden. 
# Lesen Sie in der Hilfe zu einem der angezeigten Cmdlet nach, was der Parameter bedeutet.

Get-Help -Name * -Parameter Verb

# dann z.B.: 
Get-Help -Name Get-Command -Parameter Verb

#endregion

#region A4

# Lassen Sie sich Beispiele für das Cmdlet Get-Process anzeigen.

Get-Help -Name Get-Process -Examples

#endregion

#region A5

# Welche Eigenschaften von Diensten auf Ihrem Rechner kann das 
# Cmdlet Get-Service anzeigen?

Get-Service | Get-Member -MemberType Property

#endregion

#region A6
# Recherchieren Sie mit den bekannten Mitteln
# a) Die Syntax des Cmdlets Get-Module
# b) Beispiele zum Einsatz des Cmdlets Get-PSDrive
# c) Was der Parameter -Format des Cmdlets Get-Date bedeutet

#a)
Get-Command -Name Get-Module -Syntax

#b)
Get-Help -Name Get-PSDrive -Examples

#c)
Get-Help -Name Get-Date -Parameter Format

#endregion

#region A7

# Lesen Sie die vollständigen Hilfetexte zu den vorgestellten 
# Get-Befehlen Get-History, Get-Process und Get-PSProvider

Get-Help -Name Get-History -Full
Get-Help -Name Get-Process -Full
Get-Help -Name Get-PSProvider -Full

#endregion

#region A8
# Finden Sie heraus, welche Eigenschaft Ihnen für das 
# Cmdlet Get-Module zur Verfügung stehen.

Get-Module | Get-Member -MemberType Property

#endregion
