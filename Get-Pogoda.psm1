<#

.DESCRIPTION
Skrypt wykonujący zapytanie webrequest na serwer w celu pobrania aktualnej pogody na okres 3 dni.

.EXAMPLE
Get-Pogoda -city Wrocław -country Poland

.EXAMPLE
Get-Pogoda -city "New York" -country "United States"

.NOTES
Wykonuje zapytanie webrequest. przy pomocy "curl"

#>

function Get-Pogoda($city, $country){

    function dejMjetoPogode([string]$a,[string]$b) {
    $invoke = (Invoke-WebRequest http://pl.wttr.in/"$a,$b"?F -UserAgent "curl")
    return $invoke.Content
    }

    if(($city -eq $null) -or ($country -eq $null)){
        return dejMjetoPogode("Ostrów Wielkopolski", "Poland")
    } else {
        return dejMjetoPogode($city, $country);
    }
    
}
