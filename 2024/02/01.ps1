function T1($arr) {
    $valid = $true
    if ($arr[-1] -gt $arr[0]) {
        for ($i=1;$i-lt$arr.Length;$i++) {
            if (!($arr[$i] -gt $arr[$i-1])) {
                $valid = $false
            }
        }
    }elseif ($arr[-1] -lt $arr[0]) {
        for ($i=1;$i-lt$arr.Length;$i++) {
            if (!($arr[$i] -lt $arr[$i-1])) {
                $valid = $false
            }
        }
    }else{
        $valid = $false
    }
    return $valid
}

function T2($arr) {
    $valid = $true
    for ($i=1;$i-lt$arr.Length;$i++) {
        if ([System.Math]::Abs(($arr[$i] - $arr[$i-1])) -notin (1,2,3)) {
            $valid = $false
        }
    }
    return $valid
}

Get-Content ./02-input.txt
| ForEach-Object {
    $t1r = $false
    $t2r = $false
    $arr = $_.Split(" ")|%{[int]$_}

    if (T1 -arr $arr) {
        $t1r = $true
        if (T2 -arr $arr) {
            $t2r = $true
        }
    }

    [PSCustomObject]@{
        Arr = $_
        T1R = $t1r
        T2R = $t2r
    }
} 
| Where-Object T1R -eq $true 
| Where-Object T2R -eq $true 
| Measure-Object
