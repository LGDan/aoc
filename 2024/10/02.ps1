$topology = Get-Content ./10-input.txt

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

function Get-Proxmity($grid, $x, $y) {
    [PSCustomObject]@{
        X = $x
        Y = $y-1
        Pos = 1
        Value = (($y-1 -in 0..($grid[0].Length-1)) -and ($x -in 0..($grid[0].Length-1))) ? $grid[$y-1][$x] : $null
    }
    [PSCustomObject]@{
        X = $x+1
        Y = $y-1
        Pos = 2
        Value = (($y-1 -in 0..($grid[0].Length-1)) -and ($x+1 -in 0..($grid[0].Length-1))) ? $grid[$y-1][$x+1] : $null
    }
    [PSCustomObject]@{
        X = $x+1
        Y = $y
        Pos = 3
        Value = (($y -in 0..($grid[0].Length-1)) -and ($x+1 -in 0..($grid[0].Length-1))) ? $grid[$y][$x+1] : $null
    }
    [PSCustomObject]@{
        X = $x+1
        Y = $y+1
        Pos = 4
        Value = (($y+1 -in 0..($grid[0].Length-1)) -and ($x+1 -in 0..($grid[0].Length-1))) ? $grid[$y+1][$x+1] : $null
    }
    [PSCustomObject]@{
        X = $x
        Y = $y+1
        Pos = 5
        Value = (($y+1 -in 0..($grid[0].Length-1)) -and ($x -in 0..($grid[0].Length-1))) ? $grid[$y+1][$x] : $null
    }
    [PSCustomObject]@{
        X = $x-1
        Y = $y+1
        Pos = 6
        Value = (($y+1 -in 0..($grid[0].Length-1)) -and ($x-1 -in 0..($grid[0].Length-1))) ? $grid[$y+1][$x-1] : $null
    }
    [PSCustomObject]@{
        X = $x-1
        Y = $y
        Pos = 7
        Value = (($y -in 0..($grid[0].Length-1)) -and ($x-1 -in 0..($grid[0].Length-1))) ? $grid[$y][$x-1] : $null
    }
    [PSCustomObject]@{
        X = $x-1
        Y = $y-1
        Pos = 8
        Value = (($y-1 -in 0..($grid[0].Length-1)) -and ($x-1 -in 0..($grid[0].Length-1))) ? $grid[$y-1][$x-1] : $null
    }
}

function Get-Children($grid, $x, $y) {
    $gridValue = [int]$grid[$y][$x]
    Get-Proxmity -grid $grid -x $x -y $y
    | Where-Object {$gridValue + 1 -eq ([int]$_.Value)}
    | Where-Object Pos -in (1,3,5,7)
    | ForEach-Object {
        $obj = $_
        $obj | Add-Member -MemberType NoteProperty -Name "XYKey" -Value ($obj.X.ToString() + "," + $obj.Y.ToString())
        $obj
    }
}

$trailHeads = Get-AllGridInstances -grid $topology -symbol "0"
$trailHeads
| Select-Object
| ForEach-Object {
    $crawlStack = [System.Collections.Stack]::new()
    # Push Initial
    $crawlStack.Push([PSCustomObject]@{
        X=$_.X
        Y=$_.Y
        Value=$_.Symbol
        XYKey = $_.X.ToString() + "," + $_.Y.ToString()
    })

    $nines = [System.Collections.ArrayList]::new()

    do {
        $item = $crawlStack.Pop()
        Get-Children -grid $topology -x $item.X -y $item.Y
        | ForEach-Object {
            $crawlStack.Push($_)
            #Write-Host $item.XYKey --> $_.XYKey
            if ($_.Value -eq "9") {
                [void]$nines.Add($_)
            }
        }
    } while ($crawlStack.Count -gt 0)

    $nines
    | Measure-Object
    | Select-Object -ExpandProperty Count
}
| Measure-Object -Sum