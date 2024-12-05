function Rule-Check($ruleset, $list) {
    $pass = $true
    $failedRules = [System.Collections.ArrayList]::new()
    $ruleset
    | ForEach-Object {
        $xIdx = $list.IndexOf($_[0])
        $yIdx = $list.IndexOf($_[1])
        if ($xIdx -gt -1 -and $yIdx -gt -1) {
            if ($xIdx -gt $yIdx) {
                $pass = $false
                [void]$failedRules.Add($_)
            }
        }
    }
    [PSCustomObject]@{
        List = $list
        Pass = $pass
        FailedRules = $failedRules
    }
}

function Rule-Corrector($List, $FailedRules, $AllRules) {
    # Begin the looooop
    $pass = $false
    $current = [System.Collections.ArrayList]::new()
    [void]$current.AddRange($List)
    do {
        $AllRules
        | ForEach-Object {
            $xIdx = $current.IndexOf($_[0])
            $yIdx = $current.IndexOf($_[1])
            if ($xIdx -gt $yIdx) {
                $current[$xIdx] = $_[1]
                $current[$yIdx] = $_[0]
            }
            $pass = (Rule-Check -ruleset $AllRules -list $current).Pass
        }
    } until ($pass)

    $finalCheck = Rule-Check -ruleset $AllRules -list $current

    [PSCustomObject]@{
        Original = $List
        Corrected = $current
        Pass = $finalCheck
    }
}

Get-Content ./05-input.txt
| ForEach-Object -Begin {
    $rules = [System.Collections.ArrayList]::new()
    $lists = [System.Collections.ArrayList]::new()
    $switch = $false
} -Process {
    if ($_ -eq "") {$switch = $true}else{
        if ($switch) {
            # Page Lists
            [void]$lists.Add(($_.Split(",")|%{[int]$_}))
        }else{
            # Rules
            [void]$rules.Add(($_.Split("|")|%{[int]$_}))
        }
    }
} -End {
    [PSCustomObject]@{
        Rules = $rules
        Lists = $lists
    }
}
| ForEach-Object {
    $Parsed = $_
    $ruleset = $Parsed.Rules
    $Parsed.Lists
    | ForEach-Object {
        Rule-Check -ruleset $ruleset -list $_
    }
    | Group-Object Pass
    | Where-Object Name -eq "False"
    | Select-Object -ExpandProperty Group
    | ForEach-Object {
        $l = $_
        $tempRules = $ruleset | Where-Object {($_[0] -in $l.List) -and ($_[1] -in $l.List)}
        Rule-Corrector -List $l.List -FailedRules $l.FailedRules -AllRules $tempRules
    }
    | ForEach-Object {
        $middle = ($_.Corrected.Count+1)/2
        $_.Corrected[$middle-1]
    }
    | Measure-Object -Sum
}