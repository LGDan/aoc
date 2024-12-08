$grid = Get-Content ./08-input.txt

function Get-AllGridInstances($grid, $symbol) {
    $grid
    | ForEach-Object -Begin {$y=0} {
        for ($x=0;$x-lt$_.Length;$x++){
            if ($_[$x] -ceq $symbol) {
                [PSCustomObject]@{
                    X = $x
                    Y = $y
                    Symbol = $symbol
                }
            }
        }
        $y++
    }
}

function Get-AllGridUniqueCharacters($grid) {
    $grid
    | ForEach-Object -Begin {$y=0} {
        for ($x=0;$x-lt$_.Length;$x++){
            $grid[$y][$x]
        }
        $y++
    }
    | Select-Object -Unique
}


Get-AllGridUniqueCharacters -grid $grid
| Where-Object {$_ -ne "."}
| ForEach-Object {
    $symbol = $_
    $instances = Get-AllGridInstances -grid $grid -symbol $_
    $instances
    | ForEach-Object {
        $i1 = $_
        $instances
        | ForEach-Object {
            $i2 = $_
            if (!(($i1.X -eq $i2.X)-and($i1.Y -eq $i2.Y))) {
                [PSCustomObject]@{
                    Symbol = $symbol
                    i1 = $i1
                    i2 = $i2
                }
            }
        }
    }
}
| ForEach-Object {
    # Maths
    $distanceX = $_.i1.X - $_.i2.X
    $distanceY = $_.i1.Y - $_.i2.Y
    $nodeAt = (($_.i1.X + $distanceX),($_.i1.Y + $distanceY))
    $bounds = $grid[0].Length
    $valid = ((($nodeAt[0] -ge 0) -and ($nodeAt[1] -ge 0))-and(($nodeAt[0] -lt $bounds)-and($nodeAt[1] -lt $bounds)))
    [PSCustomObject]@{
        Symbol = $_.Symbol
        i1 = $_.i1
        i2 = $_.i2
        Node = $nodeAt
        Valid = $valid
        StringRep = $nodeAt -join ","
    }
}
| Where-Object Valid -eq $true
| Select-Object -Property StringRep -Unique
| Measure-Object