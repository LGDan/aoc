$wordsearch = Get-Content ./04-input.txt

function Match($ws, $coords) {
    $x = $coords.X
    $y = $coords.Y

    # S.M
    # .A.
    # S.M

    ($ws[$y-1][$x-1] -ne $ws[$y+1][$x+1]) -and (((
        ($ws[$y-1][$x-1]),
        ($ws[$y+1][$x+1]),
        ($ws[$y-1][$x+1]),
        ($ws[$y+1][$x-1])
    ) | Sort-Object) -join "") -eq "MMSS"
}

$startCoords = $wordsearch
| Select-Object -Skip 1 -First 138
| ForEach-Object -Begin {$line=1} {
    for($i=1;$i-lt$_.Length-1;$i++) {
        if ($_[$i] -eq "A") {
            [PSCustomObject]@{
                X = $i
                Y = $line
            }       
        }
    }
    $line++
}

$startCoords 
| ForEach-Object {
    Match -ws $wordsearch -coords $_
}
| Where-Object {$_ -eq $True}
| Measure-Object