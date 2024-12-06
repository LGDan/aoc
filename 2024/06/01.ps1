$inputgrid = Get-Content ./06-input.txt

function Get-Ahead($grid, $x, $y, $direction) {
    try{
        if (($y+$direction[1] -notin 0..139) -or ($x+$direction[0] -notin 0..139)) {
            return ""
        }else{
            return $grid[$y+$direction[1]][$x+$direction[0]]
        }
    }catch{
        ""
    }
}

function Get-Visual($grid, $GuardState) {
    # Fun
    $state = $grid.Clone()
    $str = $state[$GuardState.Y].ToCharArray()
    $str[$GuardState.X] = "X"
    $state[$GuardState.Y] = $str -join ""
    $state | Write-Host
    Start-Sleep -Milliseconds 10
}

function Get-RightTurn($GuardState) {
    $direction = $GuardState.Direction
    $changed = $false
    if (($direction[0] -eq -1) -and !$changed) {$direction[1] = -1; $direction[0] = 0; $changed = $true}
    if (($direction[1] -eq 1)  -and !$changed) {$direction[1] = 0; $direction[0] = -1; $changed = $true}
    if (($direction[0] -eq 1)  -and !$changed) {$direction[1] = 1; $direction[0] = 0; $changed = $true}
    if (($direction[1] -eq -1) -and !$changed) {$direction[1] = 0; $direction[0] = 1; $changed = $true}
    $GuardState.Direction = $direction
    $GuardState.Ahead = Get-Ahead -grid $inputgrid -x $GuardState.X -y $GuardState.Y -direction $direction
    $GuardState
}

function Move-Forward($GuardState) {
    if ($GuardState.Ahead -eq "#") {
        # Do Nothing
    }elseif ($GuardState.End){
        # Also do nothing
    }else{
        $x = $GuardState.X + $GuardState.Direction[0]
        $y = $GuardState.Y + $GuardState.Direction[1]
        $direction = $GuardState.Direction
        $ahead = Get-Ahead -grid $inputgrid -x $x -y $y -direction $direction
        [PSCustomObject]@{
            X = $x
            Y = $y
            Direction = $direction
            End = $ahead -eq ""
            Ahead = $ahead
        }
    }
}

# Locate the Guard
$inputgrid | % -Begin {$y=0} -Process {
    $x = $_.IndexOf("^")
    if ($x -gt -1) {
        [PSCustomObject]@{
            X = $x
            Y = $y
            Direction = (0,-1) # Up
            End = $false
            Ahead = Get-Ahead -grid $inputgrid -x $x -y $y -direction (0,-1)
        }
    }
    $y++
}
| ForEach-Object {
    $GuardState = $_
    $Visited = @{
        ($_.X.ToString()+","+$_.Y.ToString())=$True
    }
    $i = 0
    
    do {
        if (($GuardState.Ahead -eq "#")) {
            $GuardState = Get-RightTurn -GuardState $GuardState
        }else{
            $GuardState = Move-Forward -GuardState $GuardState
            $key = ($GuardState.X.ToString() + "," + $GuardState.Y.ToString())
            if (!$Visited.ContainsKey($key)) {
                [void]$Visited.Add($key,$True)
            }
        }
        $i++
    } until ($GuardState.End)
    $Visited.Keys | Measure-Object
}