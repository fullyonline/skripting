param([string] $url1, [string] $url2, [string] $url3)

function Validate-IP {
    param([string] $Ip)
    if ($Ip -match '\d.\d.\d.\d') {
        Write-Output "Valide IP"
    }
    else {
        Write-Output "Invalide IP"
    }
}

$lenght = 0
if ($url1) {
    $lenght = $lenght + 1
}
if ($url2) {
    $lenght = $lenght + 1
}
if ($url3) {
    $lenght = $lenght + 1
}
Write-Output "Anzahl argumente: " $args.Length
Write-Output "URL1:"
$url1
Validate-IP $url1
Write-Output "URL2:" 
$url2
Validate-IP $url2
Write-Output "URL3:" 
$url3
Validate-IP $url3