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

function Show-VisualDiskMapFromArray($diskArray) {
    ($diskArray | % {$_-ne-1?$_.ToString():"."}) -join ""
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
        # Ignore compacting free space
        if ($compactionRecord -eq -1) {
            $compactionPtr--
            continue
        }
        $compactionRecordLength = 0
        $compactionRecordPtr = 0
        do {
            $compactionRecordLength++
            $compactionRecordPtr--
        } while ($diskArray[$compactionPtr+$compactionRecordPtr] -eq $compactionRecord)

        # Now we have the length of the record to compact, lets find some space
        $freeSpacePtr = 0
        do {
            if ($freeSpacePtr -ge ($compactionPtr - $compactionRecordLength)) {break}
            do {
                if ($freeSpacePtr -ge $diskSize) {break}
                $freeSpacePtr++
            } while ($diskArray[$freeSpacePtr] -ne -1)

            # We have found some free space. Lets Measure it.
            $freeSpaceLength = 0
            do {
                $freeSpaceLength++
            } while ($diskArray[$freeSpacePtr + $freeSpaceLength] -eq -1)
    
            # Is the length able to accomodate the move?
            if ($freeSpaceLength -ge $compactionRecordLength) {
                # It can be moved!
                if ($freeSpacePtr -lt $compactionPtr) {
                    $recordStart = $compactionPtr+$compactionRecordPtr+1
                    $copyPtr = 0
                    do {
                        $diskArray[$freeSpacePtr + $copyPtr] = $diskArray[$recordStart+$copyPtr]
                        $diskArray[$recordStart+$copyPtr] = -1
                        $copyPtr++
                    } while ($copyPtr -lt $compactionRecordLength)
                    # Move to next record
                }
                break
            }
        } while ($freeSpacePtr -lt $diskSize)
        
        
        $compactionPtr -= $compactionRecordLength
    } until ($compactionPtr -lt 0)

    # Checksum
    $checksumAcc = 0
    for ($diskPtr=0;$diskPtr-lt$diskSize;$diskPtr++) {
        if ($diskArray[$diskPtr] -ne -1) {
            $checksumAcc += ($diskArray[$diskPtr] * $diskPtr)
        }
    }
    $checksumAcc

}

$diskMap = Get-DiskMapAsObjects -blockmap $blockmap
$diskSize = Get-DiskSize -blockmap $blockmap

Compact-DiskObjects -diskMapObjects $diskMap -diskSize $diskSize
