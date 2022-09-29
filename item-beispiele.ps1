# New-Item
New-Item -Path . -Name "testfile1.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path . -Name "test" -ItemType "directory"

# Get-Item
Get-Item *

# Copy-Item
Copy-Item -Path .\testfile1.txt -Destination .\testfile2.txt

# Clear-Item
$test = "testttttt"
Write-Host "Vorher:"
Write-Host $test
Clear-Item Variable:test
Write-Host "Nachher:"
Write-Host $test

# Invoke-Item
Invoke-Item .\testfile1.txt

# Move-Item
Move-Item .\testfile1.txt .\test
Move-Item .\testfile2.txt .\test

# Rename-Item
Rename-Item .\test\testfile1.txt -NewName "renamed.txt"

# Remove-Item
Remove-Item .\test -Recurse