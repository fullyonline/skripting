<#
CREATING A FUNCTION
Let's create a function that works by gathering information about the current OS of your machine.
When naming functions it is best practice to use approved verbs, and use PowerShell's Verb-Noun format.
#>

<#
  .Synopsis
  Function example
  .DESCRIPTION
  Get OS version information 
#>
function Get-OSInfo {
  $osInfo =  Get-CIMInstance -Class Win32_OperatingSystem

  return $osInfo
}

<#
  .Synopsis
  Function example
  .DESCRIPTION
  Get OS version text 
#>
function Get-VersionText {
  param($version)
  
  switch ($version) {
    10 {$versionText = 'Windows 10'}
    6.3 {$versionText = 'Windows 8.1 or Server 2012 R2'}
    6.2 {$versionText = 'Windows 8 or Server 2012'}
    6.1 {$versionText = 'Windows 7 or Server 2008 R2'}
    6.0 {$versionText = 'Windows Vista or Server 2008'}
    5.2 {$versionText = 'Windows Server 2003/2003 R2'}
    5.1 {$versionText = 'Windows XP'}
    5.0 {$versionText = 'Windows 2000'}
  }
  
  return $versionText
}

<#
  .Synopsis
  Function example
  .DESCRIPTION
  Get OS version 
#>
function Get-OSVersion {

  $osInfo =  Get-CIMInstance -Class Win32_OperatingSystem

  # function call
  $versionText = Get-VersionText -version $osInfo.Version.Split('.')[0]

  return $versionText
}

# Main
Get-OSVersion


<#
Aufgabe
Schreibe weitere Funktionen, die z.B. Informationen aus dem CmdLet Get-CIMInstance ermitteln.
#>