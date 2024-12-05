function Rule-Check($ruleset, $list) {
    $pass = $true
    $ruleset
    | ForEach-Object {
        $xIdx = $list.IndexOf($_[0])
        $yIdx = $list.IndexOf($_[1])
        if ($xIdx -gt -1 -and $yIdx -gt -1) {
            if ($xIdx -gt $yIdx) {
                $pass = $false
            }
        }
    }
    [PSCustomObject]@{
        List = $_
        Pass = $pass
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
    | Where-Object Name -eq "True"
    | Select-Object -ExpandProperty Group
    | ForEach-Object {
        $middle = ($_.List.Length+1)/2
        $_.List[$middle-1]
    }
    | Measure-Object -Sum
}
