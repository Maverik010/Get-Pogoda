<#

.DESCRIPTION
Skrypt wykonujący zapytanie webrequest na serwer w celu pobrania aktualnej pogody.

.EXAMPLE
Get-Pogoda -city Wrocław -country Poland

.NOTES
Wykonuje zapytanie webrequest.

#>

function Get-Pogoda([string][Parameter(mandatory=$true)]$city, [string][Parameter(mandatory=$true)]$country){

    function dejMjetoPogode([string]$a,[string]$b) {
    $invoke = (Invoke-WebRequest http://wttr.in/"$a,$b" -UserAgent "curl" )
    return $invoke.Content
    }
    
    return dejMjetoPogode($city, $country);
}
