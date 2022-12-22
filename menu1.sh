#!/bin/bash
#
# menu.sh
# Bash Menu
#
# 12.12.2018 / Lukas Müller
#
# Variablen
# Beginn des Programmes
# Menu ausgebe

TITLE="**** Skt Menu ****"
MENU=(
"Liste aller Shell Programme"
"Neues Shell Skript erstellen"
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
;;
1)
echo -e "\n=> ${MENU[1]}\n"
;;
2|[eE]|[qQ])
echo -e "\n=> ${MENU[2]}\n"
break
;;
*)
echo -e "\n=> Ungueltige Eingabe\n"
;;
esac
done
