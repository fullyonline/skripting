<#
  .SYNOPSIS
  Analyse der Syntax
  .NOTES
    File Name      : A03-PS-Cmdlet Parameter.ps1
    Author         : Lukas Müller
  .DESCRIPTION
  Unterricht Syntax Beschreibung
  .PARAMETER
  Keine
  .EXAMPLE
  Keine
  .NOTES
  Keine
  .LINK
  Keine
#> 

#region Aufgabe
# Analysieren Sie anhand der Syntax Beschreibung die verschiedenen Parametertypen 
# des Cmdlets und beantworten Sie die nachfolgenden Fragen.

Copy-Item [-Path] <String[]> [[-Destination] <String> ] [-Container] 
    [-Credential <PSCredential> ] [-Exclude <String[]> ] [-Filter <String> ] 
    [-Force] [-Include <String[]> ] [-PassThru] [-Recurse] [-Confirm] 
    [-WhatIf] [-UseTransaction] [ <CommonParameters>]


# Fragen zu Parametertypen:
# - benannte Parameter
# - Switch-Parameter
# - positionale Parameter
# - zwingend erforderliche Parameter
# - Common Parameter (allgemeine Parameter)

#endregion

#region Lösung 
# Analyse der Syntax:

Copy-Item [-Path] <String[]> [[-Destination] <String> ] [-Container] 
    [-Credential <PSCredential> ] [-Exclude <String[]> ] [-Filter <String> ] 
    [-Force] [-Include <String[]> ] [-PassThru] [-Recurse] [-Confirm] 
    [-WhatIf] [-UseTransaction] [ <CommonParameters>]

# Fragen zu Parametertypen:
# - benannte Parameter               : -Path, -Destination, -Credential, -Exclude, -Filter, -Include
# - Switch-Parameter                 : -Container, -Force, -PassThru, -Recurse, -Confirm, -WhatIf, -UseTransaction
# - positionale Parameter            : -Path [1], -Destination [2]
# - zwingend erforderliche Parameter : -Path
# - Common Parameter                 : allgemeine Parameter 

# Bsp. -ErrorAction mit Argument SilentlyContinue)
#endregion
