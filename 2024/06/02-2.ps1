$inputgrid = Get-Content ./06-test.txt

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

function Get-Visual($grid, $GuardState, $Symbol = "X") {
    # Fun
    $state = $grid.Clone()
    $str = $state[$GuardState.Y].ToCharArray()
    $str[$GuardState.X] = $Symbol
    $state[$GuardState.Y] = $str -join ""
    $state | Write-Host
    Start-Sleep -Milliseconds 10
    Read-Host | Out-Null
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

function Get-GridColumn($grid,$x) {
    $grid[0..($grid.Count-1)][$x]
}

function Get-GridRow($grid, $y) {
    $grid[$y]
}

function Would-Intersect($grid, $TargetXY, $GuardState) {
    # Going Up
    if ($GuardState.Direction[1] -eq -1) {
        $row = Get-GridRow -grid $grid -y $GuardState.Y
        $currentSymbol = "."
        $intersect = -1
        for ($x=$GuardState.X;$currentSymbol -eq ".";$x++) {
            $intersect = $x
            $currentSymbol = $grid[$GuardState.Y][$x]
        }
        return $intersect -eq $TargetXY[0]
    }
    # Going Right
    if ($GuardState.Direction[0] -eq 1) {
        $row = Get-GridColumn -grid $grid -x $GuardState.X
        $currentSymbol = "."
        $intersect = -1
        for ($y=$GuardState.Y;$currentSymbol -eq ".";$y++) {
            $intersect = $y
            $currentSymbol = $grid[$y][$GuardState.X]
        }
        return $intersect -eq $TargetXY[1]
    }
    # Going Down
    if ($GuardState.Direction[1] -eq 1) {
        $row = Get-GridRow -grid $grid -y $GuardState.Y
        $currentSymbol = "."
        $intersect = -1
        for ($x=$GuardState.X;$currentSymbol -eq ".";$x--) {
            $intersect = $x
            $currentSymbol = $grid[$GuardState.Y][$x]
        }
        return $intersect -eq $TargetXY[0]
    }
    # Going Left
    if ($GuardState.Direction[0] -eq -1) {
        $row = Get-GridColumn -grid $grid -x $GuardState.X
        $currentSymbol = "."
        $intersect = -1
        for ($y=$GuardState.Y;$currentSymbol -eq ".";$y--) {
            $intersect = $y
            $currentSymbol = $grid[$y][$GuardState.X]
        }
        return $intersect -eq $TargetXY[1]
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
        ($_.X.ToString()+","+$_.Y.ToString())=(0,-1)
    }
    $LastTurns = [System.Collections.ArrayList]::new()

    $i = 0
    
    do {
        if (($GuardState.Ahead -eq "#")) {
            $GuardState = Get-RightTurn -GuardState $GuardState
            [void]$LastTurns.Add(($GuardState.X,$GuardState.Y))
            #if ($LastTurns.Count -gt 3) {[void]$LastTurns.RemoveAt(0)}
        }else{
            $GuardState = Move-Forward -GuardState $GuardState
            $key = ($GuardState.X.ToString() + "," + $GuardState.Y.ToString())

            # Add to visited and record direction
            if (!$Visited.ContainsKey($key)) {
                [void]$Visited.Add($key,$GuardState.Direction.Clone())
            }else{
                # If it was travelling up/down...
                if (($Visited[$key][0] -eq 0)) {
                    # ... And the guard is now travelling left and right...
                    if ($GuardState.Direction[1] -eq 0) {
                        $Visited[$key] = (2,2)
                    }
                }else{ # Must have been travelling left/right...
                    # ... And the guard is now travelling up/down...
                    if ($GuardState.Direction[0] -eq 0) {
                        $Visited[$key] = (2,2)
                    }
                }
            }

            # Check to see if guard coords line up with turn 2 (2-1)
            if (($LastTurns.Count -gt 2) -and (
                ($LastTurns|%{Would-Intersect -grid $inputgrid -TargetXY $_ -GuardState $GuardState}|Where {$_ -eq $True})
                )) {
                # The position ahead might be suitable for an obstacale...?
                $obsCoords = (($GuardState.X+$GuardState.Direction[0]),($GuardState.Y+$GuardState.Direction[1]))
                # Write-Host My Pos
                # Get-Visual -grid $inputgrid -GuardState $GuardState
                # Write-Host Proposed Obstacle
                # Get-Visual -grid $inputgrid -GuardState @{X=$obsCoords[0];Y=$obsCoords[1]}
                [PSCustomObject]@{
                    X = $obsCoords[0]
                    Y = $obsCoords[1]
                    Key = $obsCoords -join ","
                }
                Write-Host Obstacle $obsCoords
            }
            Get-Visual -grid $inputgrid -GuardState $GuardState
        }
        $i++
    } until ($GuardState.End)
}
| Group-Object Key
