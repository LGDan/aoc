$wordsearch = Get-Content ./04-input.txt

function Match($ws, $coords) {
    # 8 Checks
    $x = $coords.X
    $y = $coords.Y

    # N
    $n = ((0..3 | % {
        if ((($y-$_) -lt 0)) {}else{
            $ws[$y-$_][$x]
        }
    }) -join "") -eq "XMAS"

    # NE
    $ne = ((0..3 | % {
        if ((($y-$_) -lt 0) -or (($x+$_) -gt 140-1)) {}else{
            $ws[$y-$_][$x+$_]
        }
    }) -join "") -eq "XMAS"

    # E
    $e = ((0..3 | % {
        if ((($x+$_) -gt 140-1)) {}else{
            $ws[$y][$x+$_]
        }
    }) -join "") -eq "XMAS"

    # SE
    $se = ((0..3 | % {
        if ((($x+$_) -gt 140-1) -or (($y+$_) -gt 140-1)) {}else{
            $ws[$y+$_][$x+$_]
        }
    }) -join "") -eq "XMAS"

    # S
    $s = ((0..3 | % {
        if ((($y+$_) -gt 140-1)) {}else{
            $ws[$y+$_][$x]
        }
    }) -join "") -eq "XMAS"

    # SW
    $sw = ((0..3 | % {
        if ((($x-$_) -lt 0) -or (($y+$_) -gt 140-1)) {}else{
            $ws[$y+$_][$x-$_]
        }
    }) -join "") -eq "XMAS"

    # W
    $w = ((0..3 | % {
        if ((($x-$_) -lt 0)) {}else{
            $ws[$y][$x-$_]
        }
    }) -join "") -eq "XMAS"

    # NW
    $nw = ((0..3 | % {
        if ((($y-$_) -lt 0) -or (($x-$_) -lt 0)) {}else{
            $ws[$y-$_][$x-$_]
        }
    }) -join "") -eq "XMAS"

    ($n,$ne,$e,$se,$s,$sw,$w,$nw) | Where {$_ -eq $True} | Measure-Object
}

$startCoords = $wordsearch
| ForEach-Object -Begin {$line=0} {
    for($i=0;$i-lt$_.Length;$i++) {
        if ($_[$i] -eq "X") {
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
}| Measure-Object -Property Count -Sum