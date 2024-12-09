$blockmap = Get-Content ./09-input.txt

function Get-DiskMapAsObjects($blockmap) {
    $fileIdInc = 0
    for ($i=0;$i-lt$blockmap.Length;$i++) {
        if ($i % 2 -eq 0) {
            # Odd (File)
            [PSCustomObject]@{
                Type = "File"
                Length = [int]::Parse($blockmap[$i])
                ID = $fileIdInc
            }
            $fileIdInc++
        }else{
            # Even (Free Space)
            [PSCustomObject]@{
                Type = "Free"
                Length = [int]::Parse($blockmap[$i])
                ID = $null
            }
        }
    }
}

function Show-VisualDiskMap($diskMapObjects) {
    $diskMapObjects
    | ForEach-Object {
        if ($_.Type -eq "File") {
            Write-Host -NoNewline ($_.ID.ToString() * $_.Length)
        }else{
            Write-Host -NoNewline ("." * $_.Length)
        }
    }
    Write-Host
}

function Get-DiskSize($blockmap) {
    $blockmap.ToCharArray() 
    | ForEach-Object {[int]::Parse($_)} 
    | Measure-Object -Sum 
    | Select-Object -ExpandProperty Sum
}

function Compact-DiskObjects($diskMapObjects, $diskSize) {
    $diskArray = [int[]]::new($diskSize)
    $ptr = 0
    # Load the disk to memory
    forEach($diskObject in $diskMapObjects) {
        1..$diskObject.Length
        | ForEach-Object {
            if ($diskObject.Length -ne 0) {
                $diskArray[$ptr + $_-1] = $diskObject.Type -eq "File" ? $diskObject.ID : -1
            }
        }
        $ptr += $diskObject.Length
    }
    # Compact
    $compactionPtr = $ptr-1
    $freeSpacePtr = 0

    do {
        $compactionRecord = $diskArray[$compactionPtr]
        do {
            if ($diskArray[$freeSpacePtr] -ne -1) { $freeSpacePtr++ }
        } until ($diskArray[$freeSpacePtr] -eq -1)
        $diskArray[$freeSpacePtr] = $compactionRecord
        $diskArray[$compactionPtr] = -1
        $compactionPtr--
    } until ($compactionPtr-2 -lt $freeSpacePtr)
    # Swap final record


    # Checksum
    $checksumAcc = 0
    for ($diskPtr=0;$diskPtr-lt$diskSize;$diskPtr++) {
        if ($diskArray[$diskPtr] -ne -1) {
            $checksumAcc += ($diskArray[$diskPtr] * $diskPtr)
        }
    }
    $checksumAcc

    Write-Host load done
}

$diskMap = Get-DiskMapAsObjects -blockmap $blockmap
$diskSize = Get-DiskSize -blockmap $blockmap

Compact-DiskObjects -diskMapObjects $diskMap -diskSize $diskSize

#Show-VisualDiskMap -diskMapObjects $diskMap