<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A10-PS-Objects.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht PowerShell Objekte
  .PARAMETER
  Keine
  .EXAMPLE
  Keine
  .NOTES
  Keine
  .LINK
  Keine
#> 


<#
A1
Ermittle von Deiner Arbeitsstation OS-Version, Computer- und Disk Infos und erstelle mit 
diesen Informationen ein PowerShell Objekt ([PSCustomObject]). Verwende dazu das CmdLet New-Object.
Verwende dabei die folgenden CmdLets:
-	Get-CimInstance Win32_OperatingSystem
-	Get-CimInstance Win32_ComputerSystem
-	Get-CimInstance Win32_LogicalDisk

Das zur erstellende Benutzerdefinierte PowerShell Objekt soll nachfolgende Properties enthalten:
-	ComputerName
-	OS
-	OS-Version
-	Domain
-	Workgroup
-	Disks
Bemerkung: Bei der OS-Version sollte auch die Build-Nummer mitenthalten sein.
#>

<#
A2
Erweitern Sie die Aufgabe 1, sodass im Objekt auch die beiden Properties «AdminPasswordStatus» und «ThermalState» 
aus der Computer-Info (Win32_ComputerSystem) enthalten sind.
Setzen Sie dabei die Status- oder State Zahl in einen aussagkräftigen Text um z.B:
-	AdminPasswortStatus: 0 = Disabled, 1 = Enabled, 2 = Not Implemented usw.
-	TermalStatus: 1 = Other, 2 = Unknow usw.
#>
