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

function Get-CurrentRecordSpeed($time, $record) {
    $speed = $record / $time
    $speed
}

function Get-Hold($distance, $holdTime, $raceTime) {
    (($distance / $holdTime) - $raceTime)
}

function Invoke-Part1($textinput) {
    $lines = $textinput.Split("`n", [System.StringSplitOptions]::None)
    $time = $lines[0].Split(":")[1].Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries) -join ''
    $record = $lines[1].Split(":")[1].Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries) -join ''


    $t = [Int64]::Parse($time)
    $r = [Int64]::Parse($record)

    $currentRecordSpeed = [Math]::Floor((Get-CurrentRecordSpeed -time $t -record $r))
    $toBeat = [Math]::Floor((Get-CurrentRecordSpeed -time $t -record $r)) + 1
    # $reverse = Get-RaceResult -time $t -holdFor $currentRecordSpeed
    # $beatReverse = Get-RaceResult -time $t -holdFor $toBeat

    [pscustomobject]@{
        Time = $t
        Record = $r
        RecordSpeed = $currentRecordSpeed
        MathsRes = calc -distance $r -holdTime 10
    }
    

    # $waysToBeat = $Beat..$t|?{(Get-RaceResult -t $t -holdFor $_) -gt $r}  
    # [PSCustomObject]@{
    #     Race = $t
    #     Record = $r
    #     Ways = $waysToBeat
    #     Count = $waysToBeat | Measure-Object | Select-Object -ExpandProperty Count
    # }
    # |  ForEach-Object -Begin {
    #     $acc = 1
    # } -Process {
    #     $acc *= $_.Count
    # } -End {
    #     $acc
    # }
}

Invoke-Part1 -textinput $textinput | fl