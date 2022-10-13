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
Set-Variable c_euro -Option Constant -Value "Euro"

#d)
Write-Host "Ich habe $geld $c_euro in meiner Geldbörse"

#endregion

#region A2
# a) Legen Sie eine Arrayvariable $prozesse an, die als Werte die Namen der aktuellen 
#    auf Ihrem System laufende Prozesse enthält.
# b) Lassen Sie den 6. Eintrag des Arrays anzeigen.

#a)
$process = (Get-Process | Select-Object -Property Name)

#b)
$process[5]


#endregion

#region A3
# a) Vergleichen Sie, ob «Hans» mit «hans» identisch sind (einmal mit und einmal ohne Unterscheidung 
#    von Gross- und Kleinschreibung).
# b) Prüfen Sie, ob 74/3 grösser oder gleich 24.6 ist
# c) Finden Sie heraus, ob im Wert der Variablen $HOME der Buchstabe o enthalten ist.

#a)
if ("Hans" -eq "hans") {
  Write-Host "Hans -eq hans"
}
else {
  Write-Host "Hans NICHT hans"
}


if ("Hans" -ceq "hans") {
  Write-Host "Hans -ceq hans"
}
else {
  Write-Host "Hans NICHT hans"
}

#b)
if (74 / 3 -ge 24.6) {
  Write-Host "74/3 grösser, gleich als 24.6"
}
else {  
  Write-Host "74/3 NICHT grösser, gleich als 24.6"
}

#c)
if ($HOME -match "o") {
  Write-Host "o ist enthalten"
}
else {
  Write-Host "o ist NICHT enthalten"
}


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

$zahl = 7
if ($zahl -gt 5) {
  Write-Host "Zahl ist grösser als 5"
}
elseif ($zahl -eq 5) {
  Write-Host "Wert ist gleich 5"
}
else {
  Write-Host "Wert ist kleiner als 5"
}


#b)





#c)





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



#endregion

#region A6
# Programmieren Sie eine Schleife, die die Werte 10 bis 100 in Zehnerschritten ausgibt.




#endregion

#region A7
# Geben Sie mithilfe einer For Schleife die ganzen Vielfachen der Zahl 5 bis 
# zum Wert 100 aus.




#endregion
 