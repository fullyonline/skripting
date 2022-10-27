<#
https://www.msxfaq.de/code/powershell/psmodule.htm
#>

# Modulsample to explain basic modules
[long]$script:test=0  # initialize Variable

function Add-Modulsample {
   $script:test++
   write-host "Module1: Sub Plus-Modulsample done: Test=$script:test"
}

function Get-Modulsample {
   $script:test
   write-host "Module1: Sub Get-Modulsample done: Test=$script:test"
}

function Set-Modulsample ($value ){
   $script:test = $value
   write-host "Module1: Sub Set-Modulsample done: Test=$script:test"
}

# Es ist ratsam am Ende eine Ausgabe zu generieren. Diese wir beim Laden des Moduls angezeigt
Write-Host "ModulSample: Ready to use"
