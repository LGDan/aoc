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
function Get-AllAntennaInstances($grid) {
    $grid
    | ForEach-Object -Begin {$y=0} {
        for ($x=0;$x-lt$_.Length;$x++){
            [PSCustomObject]@{
                X = $x
                Y = $y
                StringRep = ($x.ToString() + "," + $y.ToString())
                Symbol = $grid[$y][$x]
            }
        }
        $y++
    }
    | Where-Object Symbol -ne "."
}

function Get-NodeCalculation($antennaPair) {
    $distanceX = $antennaPair.i1.X - $antennaPair.i2.X
    $distanceY = $antennaPair.i1.Y - $antennaPair.i2.Y
    $nodeAt = (($antennaPair.i1.X + $distanceX),($antennaPair.i1.Y + $distanceY))
    $bounds = $grid[0].Length
    $valid = ((($nodeAt[0] -ge 0) -and ($nodeAt[1] -ge 0))-and(($nodeAt[0] -lt $bounds)-and($nodeAt[1] -lt $bounds)))
    [PSCustomObject]@{
        Symbol = $antennaPair.Symbol
        i1 = $antennaPair.i1
        i2 = $antennaPair.i2
        dx = $distanceX
        dy = $distanceY
        Node = $nodeAt
        Valid = $valid
        StringRep = $nodeAt -join ","
        GridChar = $valid ? $grid[$nodeAt[1]][$nodeAt[0]] : ""
    }
}

$antinodeFullList = [System.Collections.ArrayList]::new()
$antinodes = Get-AllGridUniqueCharacters -grid $grid
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
    Get-NodeCalculation -antennaPair $_
}
| ForEach-Object {
    # Expander, assume no more than 50 expansions.
    $_
    $initial = $_
    $current = $initial
    1..50
    | ForEach-Object {
        $current = Get-NodeCalculation -antennaPair @{
            i1 = [pscustomobject]@{X=$current.Node[0];Y=$current.Node[1];Symbol=$current.Symbol}
            i2 = $current.i1
            Symbol = $current.Symbol
        }
        $current
    }
    | Where-Object Valid -eq $true

}
| Where-Object Valid -eq $true
| Select-Object StringRep, GridChar

[void]$antinodeFullList.AddRange(($antinodes.StringRep | Select-Object -Unique))

Get-AllAntennaInstances -grid $grid
| ForEach-Object {
    [void]$antinodeFullList.Add($_.StringRep)
}

$antinodeFullList
| Select-Object -Unique
| Measure-Object