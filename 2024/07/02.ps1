function Convert-Base([long]$number, $charset) {
    $i = 32
    [char[]]$buffer = [char[]]::new($i)
    $targetBase = $charset.Length
    do {
        $modResult = $number % $targetBase
        $buffer[$i-1] = $charset[$modResult]
        $number = ($number-$modResult) / $targetBase
        $i--
    } while ($number -gt 0)
    [char[]]$result = [char[]]::new(32-$i)
    [Array]::Copy($buffer, $i, $result, 0, 32 - $i)
    return [String]::new($result)
}

function Generate-OperatorString($length, $i) {
    $binaryRepresentation = Convert-Base -number $i -charset "012"
    $paddedToLength = $binaryRepresentation.PadLeft($length,"0")
    $changedToOperators = $paddedToLength.Replace("0","*").Replace("1","+").Replace("2","|")
    [PSCustomObject]@{
        Length = $length
        I = $i
        Operators = $changedToOperators
    }
}

function Math-Eval($opList) {
    $acc = [long]$opList[0]
    for ($i=1;$i-lt$opList.Count;$i++) {
        $operator = $opList[$i][0]
        $number = [long]($opList[$i].SubString(1))
        if ($operator -eq "+") {
            $acc = $acc + $number
        }elseif ($operator -eq "*") {
            $acc = $acc * $number
        }elseif ($operator -eq "|") {
            $acc = [long]($acc.ToString() + $number.ToString())
        }
    }
    $acc
}

Get-Content ./07-input.txt
| ForEach-Object {
    $split = $_.Split(":")
    $total = [long]$split[0]
    $numbers = $split[1].Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)|%{[long]$_}
    [PSCustomObject]@{
        Total = $total
        Numbers = [System.Collections.ArrayList]::new($numbers)
    }
}
| Select-Object
| ForEach-Object {
    $Calibration = $_
    $SymbolCountNeeded = $Calibration.Numbers.Count -1
    (0..([Math]::Pow(3,$SymbolCountNeeded+1)-1))
    | ForEach-Object {
        $lst = [System.Collections.ArrayList]::new()
        $operatorString = Generate-OperatorString -length $SymbolCountNeeded -i $_

        [void]$lst.Add($Calibration.Numbers[0])

        for ($i=1;$i-lt$Calibration.Numbers.Count;$i++) {
            [void]$lst.Add(($operatorString.Operators[$i-1] + $Calibration.Numbers[$i]))
        }

        $result = Math-Eval -opList $lst
        
        [PSCustomObject]@{
            I = $_
            Symbolsneeded = $SymbolCountNeeded
            Calibration = $Calibration.Numbers
            CalibrationTotal = $Calibration.Total
            OperatorString = $operatorString.Operators
            String = $lst -join " "
            Result = $result
            Pass = $result -eq $Calibration.Total
        }
    }
    | Where-Object Pass -eq $true
    | Select-Object -First 1
}
| Select-Object CalibrationTotal -Unique
| Measure-Object -Property CalibrationTotal -Sum
