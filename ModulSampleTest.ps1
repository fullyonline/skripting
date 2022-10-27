<#
Einführung
PowerShell Module sind ein einfacher und definierter Weg, eine PowerShell Umgebung mit zusätzlichen 
Befehlen und Commandlets zu erweitern. Allerdings müssen die Namen der bereitgestellten Funktionen 
natürlich eindeutig sind. Eigene Module sind natürlich auch immer ein Weg, Code einfach zu recyclen

PowerShell Module sind einem PowerShell Script sehr ähnlich. 
Sie haben den gleichen Aufbau und können mit den bekannten Editoren erstellt werden und haben 
einige deutliche Vorteile:

- Einbinden und Entfernen bei Bedarf
    Im Gegensatz zu Funktionen aus Skripten können Module zur Laufzeit einfach eingebunden aber auch wieder entladen werden

- Funktionen exportiert
    Per Default werden alle Funktionen im Modul exportiert. Dies kann aber über "Export-ModuleMember" im Modul 
    selbst gesteuert werden, so das auch "private Funktionen" möglich sind, die aus der Session nicht gefunden und aufgerufen 
    werden können. "Privat" sind diese natürlich nur hinsichtlich des Code. Der Source-Code eines PSM1 ist natürlich einsehbar.

- Lokale Variablen
    Alle in dem Modul verwendeten Variablen sind per Default nicht ausserhalb sichtbar.

Interessant ist, dass die Funktionen z.B. z.B. eigene Variablen und Objekte verwenden können und diese zwischen 
den Aufrufen bestehen bleiben. Es ist damit zwar noch keine Klasse, weil ein Modul nur einmal eingebunden werden kann, 
aber für viele Zwecke wird oft nur ein "Objekt" verwendet.

Die PowerShell beobachtet dabei die Daten in der folgenden Reihenfolge:
 - PSD1 - Manifest-Datei
 - PSM1 - Skriptmodul
 - DLL - Kompiliertes Modul

Ein Modul wird aber immer nur einmal geladen. Gerade wenn Sie Module entwickeln und ändern 
müssen Sie das Modul in der TestUmgebung immer erst entladen und neu laden oder mit "-force" laden. 
Bestehende Variablen im Modul werden dann aber natürlich zurück gesetzt.


Wichtige Hinweise:

Ausgabe am Anfang/Ende
  Wenn Sie ausserhalb der Funktionen, die später als Commandlet agieren auch Code verwenden, 
  dann wird dieser beim Laden des Module direkt ausgeführt. 
  Es ist ratsam hier eine Bildschirmausgabe vorzusehen.

Initialisierung
  Sie können in dem Code aber auch schon erste Komponenten Initialisieren. 
  Ich nutze dies im Beispiel für die Variable "Test", welche durch das Prefix "$Script:" innerhalb des 
  Skripts als global definiert wird. 
  Sie könnten hier aber auch z.B. SQL-Connections, PSSessions oder ADSI-Verbindungen aufbauen.

Variablen-Scope
  Sie sehen hier auch die Feinheiten beim Einsatz von Variablen. "Test" ist global bezüglich des Skripts, 
  sonst könnte ich die Werte nicht in den Funktionen verändern. Die Variable ist aber nicht in der Session erreichbar, 
  welche diese Modul importiert.
  Experimentieren Sie einfach etwas mit Modulen und verändern Sie den Beispielcode, um das unterschiedliche Verhalten 
  zu sehen. 
  Vergessen Sie aber nicht nach Änderungen am Modul diese neu zu laden.
#>


# Laden, Finden, Sharen
# Pfad zu den Modulen anzeigen
$env:psmodulepath

# Modul laden
import-module 'D:\Services\OneDrive - ipso Bildung AG\Juventus\Skt\U4\Module\ModulSample.psm1'

Add-Modulsample 
Get-Modulsample
Set-Modulsample -value 100
