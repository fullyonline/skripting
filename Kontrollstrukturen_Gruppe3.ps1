<#
Autoren: 
- Jan Eisenbach
- Luca Homberger
- Fabian Moosmann
- Romano Sabbatella

Aufgabe 3:
- Verzweigungen
- Fallunterscheidung
- Schleifen
- break / continue
#>


#
# if, elseif, else
#
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

#
# Fallunterscheidung (switch)
#
$tag = 3
switch ( $tag ) {
    0 { $result = 'Sonntag' }
    1 { $result = 'Montag' }
    2 { $result = 'Dienstag' }
    3 { $result = 'Mittwoch' }
    4 { $result = 'Donnerstag' }
    5 { $result = 'Freitag' }
    6 { $result = 'Samstag' }
}
$result

#
# Schleifen
#

# for-Schleife
for ($i = 10; $i -le 100; $i += 10) {
    $i
}

# foreach-Schleife
$array = 42, 20, 60, 41
foreach ($item in $array) {
    $item
}

# do while -Schleife
$i = 1
do {
    $i
    $i++
}while ($i -lt 5)

# while-Schleife
$i = 1
while ($i -lt 5) {
    $i
    $i++
}

#
# break / continue
#
$array = 42, 20, 60, 41
# break --> bricht bei condition komplett raus
foreach ($item in $array) {
    $item
    if ($item -eq 60) {
        break
    } 
}

# continue --> nächster Schlaufendurchlauf
$array = 42, 20, 60, 41
foreach ($item in $array) {
    if ($item % 20 -eq 0) {
        continue
    }
    $item
}