# A1
$ErrorActionPreference = "Continue"
Write-Host(1 / 0)
Write-Host("Läuft weiter mit Fehler")
$ErrorActionPreference = "SilentlyContinue"
Write-Host(1 / 0)
Write-Host("Läuft leise weiter mit Fehler")
$ErrorActionPreference = "Stop"
Write-Host(1 / 0)
Write-Host("Läuft nicht weiter")

# A2 - optional



# A3 - optional