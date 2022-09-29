# Verwenden der PowerShell-Hilfe 

#region 1. Hilfe aktualisieren 
Update-Help –UICulture en-US -Force 
#endregion 

#region 2. Hilfe zu einem CmdLet anzeigen 
Get-Help -Name Get-Service 
Get-Help -Name Get-Service -Detailed 
Get-Help -Name Get-Service -Full 
Get-Help -Name Get-Service -Eamples 
#endregion 

# region 3. Hilfe zu einem Parameter anzeigen 
Get-Help -Name * -Parameter Verb  
# dann z.B.:  
Get-Help -Name Get-Command -Parameter Verb 
#endregion 

#region 4. Beispiele anzeigen  
Get-Help -Name Get-Process -Examples 
#endregion 

#region Verwenden wichtiger Cmdlets 
# 1. 
Get-Command -Verb Import 

# 2. 
Get-Service | Get-Member -MemberType Property 

# 3  
#a)  
Get-Command -Name Get-Module -Syntax 

#b)  
Get-Help -Name Get-PSDrive -Examples 

#c)  
Get-Help -Name Get-Date -Parameter Format 

#4. 
Get-Help -Name Get-History -Full 
Get-Help -Name Get-Process -Full 
Get-Help -Name Get-PSProvider -Full 

#5.  
Get-Module | Get-Member -MemberType Property 
#endregion 