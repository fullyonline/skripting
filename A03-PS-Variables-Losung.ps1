<#
  .SYNOPSIS
  Einführung PowerShell
  .NOTES
    File Name      : A03-PS-Variables.ps1
    Author         : Lukas Müller
  .DESCRIPTION
    Unterricht Variablen
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
# a) Erstellen Sie eine Variable $geld und weisen Sie ihr den Wert 68 zu.
# b) Teilen Sie den Wert mit einem weiteren Befehl durch 4. Nutzen Sie dafür 
#    einen möglichst kurzen Befehl.
# c) Erstellen Sie eine Konstante $c_euro mit dem Wert Euro in meiner Geldbörse.
# d) Lassen Sie den Satz «Ich habe x Euro in meiner Geldbörse» ausgeben. 
#    Anstelle des «x» sollt der Wert der Variablen $geld stehen.
#a)
$geld = 68

#b)
$geld /= 4

#c)
New-Variable -Name c_euro -Value "Euro in meiner Geldbörse" -Option Constant

Get-Help New-Variable -Full

#d)
Write-Host "Ich habe $geld $c_euro."
#endregion

#region A2
# a) Legen Sie eine Arrayvariable $prozesse an, die als Werte die Namen der aktuellen 
#    auf Ihrem System laufende Prozesse enthält.
# b) Lassen Sie den 6. Eintrag des Arrays anzeigen.

#a)
$prozesse = (Get-Process | Select-Object -Property Name)

#b)
$prozesse[5]
#endregion

#region A3
# a) Vergleichen Sie, ob «Hans» mit «hans» identisch sind (einmal mit und einmal ohne Unterscheidung 
#    von Gross- und Kleinschreibung).
# b) Prüfen Sie, ob 74/3 grösser oder gleich 24.6 ist
# c) Finden Sie heraus, ob im Wert der Variablen $HOME der Buchstabe o enthalten ist.

#a)
"Hans" -eq "hans"
"Hans" -ceq "hans"

#b)
(74 / 3) -ge 24.6	# Klammersetzung empfohlen

#c)
$HOME -match "o"
#endregion

#region A4
# a) Speichern Sie einen Wert zwischen 1 und 10 in einer Variablen. 
#    Fragen Sie ab, ob der Wert grösser als 5 ist, und geben Sie den Text «Wert ist grösser als 5» aus, 
#    wenn die Bedingung zutrifft.
# b) Erweitern Sie das Beispiel: Prüfen Sie, ob der Variablenwert gleich 5 ist, und geben Sie in dem Fall 
#    den Text «Wert ist gleich 5» aus.
# c) Erweitern Sie nochmals das Beispiel: Geben Sie jetzt nur noch für alle anderen Fälle den Text «Wert 
#    ist kleiner als 5» aus.
#a)
$var = 7
If ($var -gt 5)
{
     "Wert ist größer als 5"
}

#b)
If ($var -gt 5) 
{
  "Wert ist größer als 5"
}
ElseIf ($var -eq 5)
{
  "Wert ist gleich 5"
}

#c)
If ($var -gt 5) 
{
  "Wert ist größer als 5"
}
ElseIf ($var -eq 5)
{
  "Wert ist gleich 5"
}
Else
{
  "Wert ist kleiner als 5"
}
#endregion

#region A5
# Legen Sie eine Variable $note an und weisen Sie ihr einen Wert zwischen 1 und 6 zu. 
# Verwenden Sie die Switch Anweisung, um für die Werte die entsprechenden Texte gemäss 
# der folgenden Tabelle auszugeben.
# Experimentieren Sie mit verschiedenen Werten.

# Note	Text
# 1	Ungenügend
# 2	Mangelhaft
# 3	Ausreichend
# 4	Befriedigend
# 5	Gut
# 6	Sehr gut

# Tipp: Verwenden Sie die PowerShell ISE.
$note = 1    # mit verschiedenen Werten experimentieren
Switch ($note)
{
	1 {"Note: sehr gut"}
	2 {"Note: gut"}
	3 {"Note: befriedigend"}
	4 {"Note: ausreichend"}
	5 {"Note: mangelhaft"}
	6 {"Note: ungenügend"}
    default {"falsche Note"}
}
#endregion

#region A6
# Programmieren Sie eine Schleife, die die Werte 10 bis 100 in Zehnerschritten ausgibt.
$var = 10
While ($var -le 100)
{
	Write-Host $var
	$var = $var + 10
}
#endregion

#region A7
# Geben Sie mithilfe einer For Schleife die ganzen Vielfachen der Zahl 5 bis 
# zum Wert 100 aus.
For ($zahl = 5; $zahl -le 100; $zahl += 5) 
{
  Write-Host $zahl
}
#endregion
 
