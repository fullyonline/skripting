# New-Item - Neuerstellen eines Elementes
New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path . -Name "test" -ItemType "directory"

# Get-Item - Auflisten der Dateien
Get-Item *

# Copy-Item - Kopieren eines Elementes
Copy-Item -Path .\testfile1.txt -Destination .\testfile2.txt

# Clear-Item - Clearen einer Variabel
$test = "testttttt"
Write-Host "Vorher:"
Write-Host $test
Clear-Item Variable:test
Write-Host "Nachher:"
Write-Host $test

# Invoke-Item - Aufrufen einer Datei
Invoke-Item .\testfile1.txt

# Move-Item - Verschieben eines Elementes
Move-Item .\testfile1.txt .\test
Move-Item .\testfile2.txt .\test

# Rename-Item - Element umbenennen
Rename-Item .\test\testfile1.txt -NewName "renamed.txt"

# Remove-Item - Löschen von Elementen
Remove-Item .\test -Recurse