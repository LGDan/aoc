$textinput = @'
Time:        42     89     91     89
Distance:   308   1170   1291   1467
'@

$testcase = @'

'@

function Get-RaceResult($time, $holdFor) {
    $availableTime = $time - $holdFor
    $distanceTravelled = $availableTime * $holdFor
    $distanceTravelled
}

function Invoke-Part1($textinput) {
    $lines = $textinput.Split("`n", [System.StringSplitOptions]::None)
    $time = $lines[0].Split(":")[1].Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)
    $record = $lines[1].Split(":")[1].Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)

    0..3|ForEach-Object {
        $t = [Int]::Parse($time[$_])
        $r = [Int]::Parse($record[$_])
        $waysToBeat = 0..$t|?{(Get-RaceResult -t $t -holdFor $_) -gt $r}  
        [PSCustomObject]@{
            Race = $t
            Record = $r
            Ways = $waysToBeat
            Count = $waysToBeat | Measure-Object | Select-Object -ExpandProperty Count
        }
    }
    |  ForEach-Object -Begin {
        $acc = 1
    } -Process {
        $acc *= $_.Count
    } -End {
        $acc
    }
}

Invoke-Part1 -textinput $textinput