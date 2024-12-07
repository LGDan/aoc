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

(0..10)|%{(Convert-Base -number $_ -charset "01").PadLeft(5,"0")}