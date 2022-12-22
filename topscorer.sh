#!/bin/bash
#
# topscorer.sh
# topscorer datenanalyse
#
# 22.12.2022 / Romano Sabbatella
#
# Variablen
# Beginn des Programs
# Datenanalyse

function getTopscorer {
    # sort -r4k --> zeile 4 wird sortiert, head -n1 --> erste Zeile aus geyieldetem result
  sort topscorer.csv -t";" -k4r | head -n1
}

function getWestrumCaseSensitive {
    # sort -rk4 --> zeile 4 wird sortiert, head -n1 --> erste Zeile aus geyieldetem result
  grep -w "Westrum" topscorer.csv
}

function getWestrumCaseInsensitive {
    # sort -rk4 --> zeile 4 wird sortiert, head -n1 --> erste Zeile aus geyieldetem result
  grep -i -w "Westrum" topscorer.csv
}

function getNamesAndScores {
    # -f --> Liste komma separiert
  cut -d";" -f1,2,4 topscorer.csv
}

function getSortByNames {
    # sort -rk2 --> zeile 2 wird sortiert
  sort topscorer.csv -t";" -k2r
}

function getSortByScores {
    # sort -rk2 --> zeile 2 wird sortiert
  sort topscorer.csv -t";" -k4r
}

function getSortByNamesReversed {
    # sort -rk2 --> zeile 2 wird sortiert
  sort topscorer.csv -t";" -k2
}

function getSortByClub {
    # sort -rk2 --> zeile 2 wird sortiert
  sort topscorer.csv -t";" -k3r
  sort topscorer.csv -t";" -k3
}

function getClubsUnique {
  cut -d";" -f3 topscorer.csv | uniq
}

TITLE="**** Topscorer Menu ****"
MENU=(
"Topscorer"
"Suche den Spieler Westrum"
"Suche den Spieler westrum ohne case sensitive"
"Listen sie die Spielernamen und die Punkte"
"Geben sie die Topscorerliste sortiert nach Spielernamen aus"
"Listen Sie die Topscorerliste absteigend nach Spielernamen aus"
"Geben sie die Tioscorerliste nach Verein aufsteigend und absteigend aus"
"Listen sie die Vereine ohne dupplikate auf"
"Listen sie die Eintraegfe nach der Anzahl Punkte absteigend"
"Ende"
)

ANZAHL=${#MENU[*]}

while true; do

echo "$TITLE"

for ((i=0; $i<$ANZAHL; i=$i+1)); do
echo "$i) ${MENU[$i]}"
done

echo -n "Auswahl eingeben, mit ENTER bestaetigen"
read ANTWORT

case $ANTWORT in
0)
echo -e "\n=> ${MENU[0]}\n"
getTopscorer;;
1)
echo -e "\n=> ${MENU[1]}\n"
getWestrumCaseSensitive;;
2)
echo -e "\n=> ${MENU[2]}\n"
getWestrumCaseInsensitive;;
3)
echo -e "\n=> ${MENU[3]}\n"
getNamesAndScores;;
4)
echo -e "\n=> ${MENU[4]}\n"
getSortByNames;;
5)
echo -e "\n=> ${MENU[5]}\n"
getSortByNamesReversed;;
6)
echo -e "\n=> ${MENU[6]}\n"
getSortByClub;;
7)
echo -e "\n=> ${MENU[7]}\n"
getClubsUnique;;
8)
echo -e "\n=> ${MENU[8]}\n"
getSortByScores;;
10|[eE]|[qQ])
echo -e "\n=> End\n"
break
;;
*)
echo -e "\n=> Ungueltige Eingabe\n"
;;
esac
done
