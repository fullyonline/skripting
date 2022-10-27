#region Funktionen

# ohne Parameter
function Name { Anweisungsblock }

# mit Parameters
function Name ($Parameter1, $Parameter2)
{ Anweisungsblock }

function Name
{ Param ($Parameter1, $Parameter2)
  Anweisungsblock 
}

# mit Parameters (typisiert)
function Name ([Parameter(Mandatory=$true)][int] $Parameter1, [string] $Parameter2)
{ Anweisungsblock }


Function Get-LargeFiles ($length)
{
	Get-ChildItem C:\Windows | Where-Object {$_.length -ge $length}
}

Get-LargeFiles 500
Get-LargeFiles 1MB
Get-LargeFiles


Function Get-LargeFiles ($location = "C:\Windows", $length = 1MB)
{
	Get-ChildItem $location | Where-Object {$_.length -ge $length}
}

Get-Help Get-LargeFiles

# Aufruf
Get-LargeFiles -location C:\Windows -length 500
Get-LargeFiles -length 1MB
Get-LargeFiles


function Get-Error([Parameter(Mandatory=$true)]$LogName)
{
    Get-EventLog -LogName $LogName -EntryType Error -After (Get-Date).AddDays(-1)
}

get-help Get-Error


#Aufruf
Get-Error -LogName "Application"


Function Test-Switch ([switch]$AnAus)
{
	If ($AnAus)
	{
		Write-Host "Eingeschaltet"
	}
	Else
	{
		Write-Host "Ausgeschaltet"
	}
}

Get-Help Test-switch

# Funktionsaufruf
Test-Switch -AnAus


function Show-Function2 {
   Param([String]$Parameter1 = "Hello",
         [String]$Parameter2 = "Max Muster")

   Write-Host "Function2: $([System.String]::Concat($Parameter1," ",$Parameter2))"
    <#
        .Synopsis
        A brief description of the function or script
        Verbindet 2 Strings

        .DESCRIPTION
        A detailed description of the function or script.
        Verbindet zwei Strings mit der Concat-Methode der Klasse System.String

        .PARAMETER Parameter1
        The description of parameter1. You can include a Parameter keyword for
        each parameter in the function or script syntax

        .PARAMETER Parameter2
        The description of parameter2

        .INPUTS
        The Microsoft .NET Framework types of objects that can be piped to the function

        .OUTPUTS
        The .NET Framework type of the objects that the cmdlet returns

        .EXAMPLE
        C:\PS> Show-Function2 -Parameter2 "World"
            
        .EXAMPLE
        C:\PS> Show-Function2 -Parameter1 "Good" -Parameter2 "Morning"
            
        .LINK
        Onlineversion: http://technet.microsoft.com/en-us/library/dd819489.aspx

        .LINK
        www.powershell.com
    #>
}

get-help Show-Function2


function Get-Altersfunktion($fullname, $birthday)
{
    $Tage = [int] ([System.DateTime]::now - [DateTime]$birthday).TotalDays

    return "$($fullname) ist $Tage Tage alt!"
}

Get-Altersfunktion -fullname "Lukas" -birthday ([DateTime]::ParseExact("10.04.2018", "dd.MM.yyyy", $null))

$a=[datetime]::ParseExact("10.04.2018", "dd/MM/yyyy", $null)
$a



Function Get-MyProcess2 ($FilterName = "s*", [switch]$Liste)
{
    <#
      .SYNOPSIS
      Prozesse filtern und sortieren
      .DESCRIPTION
      Sie geben einen Filter vor, der auf die gesuchten Prozesse angewendet wird.
      Es werden die Eigenschaften ID, ProcessName und CPU angezeigt.
      Es findet eine Sortierung nach der Eigenschaft CPU statt.
      .EXAMPLE
      Get-MyProcess2
      Ein Aufruf ohne Parameter führt die Funktion mit den definierten Standardwerten aus.
      .EXAMPLE
      Get-MyProcess2 -FilterName power*
      Hier wird nach Prozessen gefiltert, deren Name mit der zeichenfolge "power" beginnt.
      .EXAMPLE
      Get-MyProcess2 -FilterName power* -Liste
      Hier wird nach Prozessen gefiltert, deren Name mit der zeichenfolge "power" beginnt.
      Zusätzlich wird die Ausgabe in Form einer Liste vorgenommen.
      .PARAMETER FilterName
      Legt einen Filter für die auszuwählenden Prozesse fest, z.B. *host*, power* oder w*.
      .PARAMETER Liste
      Switch-Parameter für die Ausgabe als Liste. Wird der Parameter nicht angegeben, erfolgt die Ausgabe als Tabelle.
    #>
    If ($Liste)
    {
        Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending | Format-List
    }
    Else
    {
        Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
    }
}

## Hilfe anzeigen
Get-Help Get-MyProcess2

function Get-MwSt([Parameter(Mandatory=$true)][double]$Betrag, [double]$statz = 7.7)
{
    $Betrag / 100 * $statz
}

#Aufruf
Get-MwSt -Betrag 100

<#
For example, the following function finds all .jpg files 
in the current user's directories that were changed 
after the start date.
#>
function Get-NewPix
{
  $start = Get-Date -Month 1 -Day 1 -Year 2010
  $allpix = Get-ChildItem -Path $env:UserProfile\*.jpg -Recurse
  $allpix | where {$_.LastWriteTime -gt $Start}
}

function Get-SmallFiles ($Size = 100) 
{
  Get-ChildItem $HOME | where {
    $_.Length -lt $Size -and !$_.PSIsContainer
  }
}

Get-SmallFiles -Size 50


function Get-PipelineBeginEnd
{
  begin {"Begin: The input is $input"}
  end {"End:   The input is $input" }
}

1,2,4 | Get-PipelineBeginEnd

function Get-PipelineInput
{
  process {"Processing:  $_ " }
  end {"End:   The input is: $input" }
}


function Time ($name)
{
    $date = Get-Date
    If ($date.Hour -lt 12 -and $date.Hour -gt 6)
    {
          "Guten Morgen $name,$nl Es ist $($date.DateTime)"
    }
    elseif ($date.Hour -gt 12 -and $date.Hour -lt 19)
    {
         "Guten Tag $name,$nl Es ist $($date.DateTime)"
    }
    elseif ($date.Hour -gt 19 -and $date.Hour -lt 24)
    {
         "Guten Abend $name,$nlEs ist $($date.DateTime)"
    }
}
Time -name Stefan Rehwald
Time -name "Konrad Ernst Otto Zuse"
Time ("Rudolf Diesel")
$User = "Nikolaus Kopernikus"
Time ($User)

#endregion

#region Skript mit Parametern

# .\StartArgs.ps1 Parameter1 Parameter2 Parameter3
# ohne Klammern und getrennt durch Leerzeichen

"Anzahl der Start Argumente:" + $args.Count
for ( $i = 0; $i -lt $args.count; $i++ ) 
{
    $args[$i]
}

#endregion

#region Filter

Filter NewFiles ([int]$tage)
{
    $jetzt = Get-Date
    $_ | Where-Object { ($jetzt - $_.LastWriteTime).Days -lt $tage }
}

## Aufruf
Get-ChildItem C:\Windows | NewFiles 10


Function Get-MyProcess3 ($FilterName = "s*")
{
    Get-Process -Name $FilterName | Select-Object -Property Id, ProcessName, CPU | Sort-Object { $_.CPU} -Descending
}

Filter Liste
{
    $_ | Format-List
}

## Aufruf
Get-MyProcess3 | Liste

#endregion
