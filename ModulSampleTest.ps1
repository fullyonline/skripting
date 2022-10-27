<#
Einf�hrung
PowerShell Module sind ein einfacher und definierter Weg, eine PowerShell Umgebung mit zus�tzlichen 
Befehlen und Commandlets zu erweitern. Allerdings m�ssen die Namen der bereitgestellten Funktionen 
nat�rlich eindeutig sind. Eigene Module sind nat�rlich auch immer ein Weg, Code einfach zu recyclen

PowerShell Module sind einem PowerShell Script sehr �hnlich. 
Sie haben den gleichen Aufbau und k�nnen mit den bekannten Editoren erstellt werden und haben 
einige deutliche Vorteile:

- Einbinden und Entfernen bei Bedarf
    Im Gegensatz zu Funktionen aus Skripten k�nnen Module zur Laufzeit einfach eingebunden aber auch wieder entladen werden

- Funktionen exportiert
    Per Default werden alle Funktionen im Modul exportiert. Dies kann aber �ber "Export-ModuleMember" im Modul 
    selbst gesteuert werden, so das auch "private Funktionen" m�glich sind, die aus der Session nicht gefunden und aufgerufen 
    werden k�nnen. "Privat" sind diese nat�rlich nur hinsichtlich des Code. Der Source-Code eines PSM1 ist nat�rlich einsehbar.

- Lokale Variablen
    Alle in dem Modul verwendeten Variablen sind per Default nicht ausserhalb sichtbar.

Interessant ist, dass die Funktionen z.B. z.B. eigene Variablen und Objekte verwenden k�nnen und diese zwischen 
den Aufrufen bestehen bleiben. Es ist damit zwar noch keine Klasse, weil ein Modul nur einmal eingebunden werden kann, 
aber f�r viele Zwecke wird oft nur ein "Objekt" verwendet.

Die PowerShell beobachtet dabei die Daten in der folgenden Reihenfolge:
 - PSD1 - Manifest-Datei
 - PSM1 - Skriptmodul
 - DLL - Kompiliertes Modul

Ein Modul wird aber immer nur einmal geladen. Gerade wenn Sie Module entwickeln und �ndern 
m�ssen Sie das Modul in der TestUmgebung immer erst entladen und neu laden oder mit "-force" laden. 
Bestehende Variablen im Modul werden dann aber nat�rlich zur�ck gesetzt.


Wichtige Hinweise:

Ausgabe am Anfang/Ende
  Wenn Sie ausserhalb der Funktionen, die sp�ter als Commandlet agieren auch Code verwenden, 
  dann wird dieser beim Laden des Module direkt ausgef�hrt. 
  Es ist ratsam hier eine Bildschirmausgabe vorzusehen.

Initialisierung
  Sie k�nnen in dem Code aber auch schon erste Komponenten Initialisieren. 
  Ich nutze dies im Beispiel f�r die Variable "Test", welche durch das Prefix "$Script:" innerhalb des 
  Skripts als global definiert wird. 
  Sie k�nnten hier aber auch z.B. SQL-Connections, PSSessions oder ADSI-Verbindungen aufbauen.

Variablen-Scope
  Sie sehen hier auch die Feinheiten beim Einsatz von Variablen. "Test" ist global bez�glich des Skripts, 
  sonst k�nnte ich die Werte nicht in den Funktionen ver�ndern. Die Variable ist aber nicht in der Session erreichbar, 
  welche diese Modul importiert.
  Experimentieren Sie einfach etwas mit Modulen und ver�ndern Sie den Beispielcode, um das unterschiedliche Verhalten 
  zu sehen. 
  Vergessen Sie aber nicht nach �nderungen am Modul diese neu zu laden.
#>


# Laden, Finden, Sharen
# Pfad zu den Modulen anzeigen
$env:psmodulepath

# Modul laden
import-module 'D:\Serioese_Projekte\Juventus\skripting\ModulSample.psm1'

Add-Modulsample 
Get-Modulsample
Set-Modulsample -value 100
