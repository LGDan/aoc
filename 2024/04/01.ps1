function SearchUDLR($ws, $coords, $word) {
    $x = $coords.X
    $y = $coords.Y
    $total = 0
    # Forward
    $total += ([System.Text.RegularExpressions.Regex]::new($word).Matches($ws -join " ")).Count

    # Reverse
    $wch = $word.ToCharArray()
    [array]::Reverse($wch)
    $wordReversed = ($wch -join "")
    $total += ([System.Text.RegularExpressions.Regex]::new($wordReversed).Matches($ws -join " ")).Count

    # Down
    $total += ([System.Text.RegularExpressions.Regex]::new($word).Matches(((0..$wordsearch[0].Length) | %{$x=$_;$wordsearch | % {$_[$x]}}) -join "")).Count

    # Up
    $total += ([System.Text.RegularExpressions.Regex]::new($wordReversed).Matches(((0..$wordsearch[0].Length) | %{$x=$_;$wordsearch | % {$_[$x]}}) -join "")).Count

    $total
}

function SearchDiag($ws, $word) {
    $total = 0

    # Diagonal Down (Southeast)
    # Oh boy this is gonna be wacky
    $wsSE = $ws | % -Begin {$y=0} -Process {
        (" " * ($ws[0].Length - 1 - $y)) + $_ + (" " * ($y))
        $y++
    }
    $total += ([System.Text.RegularExpressions.Regex]::new($word).Matches(((0..$wsSE[0].Length) | %{$x=$_;$wsSE | % {$_[$x]}}) -join "")).Count

    # Diagonal Up (Northwest)
    $wordArr = $word.ToCharArray()
    [array]::Reverse($wordArr)
    $wordReversed = ($wordArr -join "")
    $total += ([System.Text.RegularExpressions.Regex]::new($wordReversed).Matches(((0..$wsSE[0].Length) | %{$x=$_;$wsSE | % {$_[$x]}}) -join "")).Count

    # Diagonal Down (Southwest)
    $wsSW = $ws | % -Begin {$y=0} -Process {
        (" " * ($y)) + $_ + (" " * ($ws[0].Length - 1 - $y))
        $y++
    }
    $total += ([System.Text.RegularExpressions.Regex]::new($word).Matches(((0..$wsSW[0].Length) | %{$x=$_;$wsSW | % {$_[$x]}}) -join "")).Count

    # Diagonal Up (Northeast)
    $total += ([System.Text.RegularExpressions.Regex]::new($wordReversed).Matches(((0..$wsSW[0].Length) | %{$x=$_;$wsSW | % {$_[$x]}}) -join "")).Count

    $total
}

$wordsearch = Get-Content ./04-input.txt

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

(SearchUDLR -ws $wordsearch -coords $_ -word "XMAS") + (SearchDiag -ws $wordsearch -word "XMAS")