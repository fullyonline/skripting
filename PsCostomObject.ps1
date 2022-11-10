# A1
$os = Get-CimInstance Win32_OperatingSystem
$cs = Get-CimInstance Win32_ComputerSystem
$ld = Get-CimInstance Win32_LogicalDisk

$myObj = [PSCustomObject]@{
    ComputerName = $cd.ComputerName
    OS           = $os.Name
    OsVersion    = $os.Version
    Domain       = $cs.Domain
    Workgroup    = $os.Workgroup
    Disk         = $ld.Name
}

Write-Host($myObj)

# A2 - optional

