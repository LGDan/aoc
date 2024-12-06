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
    Read-Host
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
        ($_.X.ToString()+","+$_.Y.ToString())=(0,-1)
    }
    $i = 0
    
    do {
        if (($GuardState.Ahead -eq "#")) {
            $GuardState = Get-RightTurn -GuardState $GuardState
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
        }
        $i++
    } until ($GuardState.End)


    # Weird rule?
    $Visited.GetEnumerator()
    | Where-Object {$_.Value[0] -eq 2}
    | ForEach-Object {
        $cross = $_.Key.Split(",")|%{[int]$_}
        Write-Host Cross At
        Get-Visual -grid $inputgrid -GuardState @{X=$cross[0];Y=$cross[1]}

        # Get Characters
        $n = $inputgrid[$cross[1]-1][$cross[0]]
        $e = $inputgrid[$cross[1]][$cross[0]+1]
        $s = $inputgrid[$cross[1]+1][$cross[0]]
        $w = $inputgrid[$cross[1]][$cross[0]-1]

        # Get Coords
        $nc = ($cross[0], ($cross[1] - 1))
        $ec = (($cross[0]+1), $cross[1])
        $sc = ($cross[0], ($cross[1]+1))
        $wc = (($cross[0]-1), $cross[1])

        # Get direction of travel
        $nd = $Visited[$nc-join","]
        $ed = $Visited[$ec-join","]
        $sd = $Visited[$sc-join","]
        $wd = $Visited[$wc-join","]

        # If north direction was visited whilst travelling down
        if ($nd) {if ($nd[1] -eq 1){
            # Put obstacle in south position, if it's not already an obstacle.
            $s -ne "#" ? @{Result=$sc} : $null
        }}

        # If east direction was visited whilst travelling left
        if ($ed) {if ($ed[0] -eq -1){
            # Put obstacle in west position, if it's not already an obstacle.
            $w -ne "#" ? @{Result=$wc} : $null
        }}

        # If south direction was visited whilst travelling up
        if ($sd) {if ($sd[1] -eq -1){
            # Put obstacle in north position, if it's not already an obstacle.
            $n -ne "#" ? @{Result=$nc} : $null
        }}

        # If west direction was visited whilst travelling right
        if ($wd) {if ($wd[0] -eq 1){
            # Put obstacle in east position, if it's not already an obstacle.
            $e -ne "#" ? @{Result=$ec} : $null
        }}

    }
}