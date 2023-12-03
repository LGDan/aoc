$textinput = @'

'@

$testcase = @'

'@

function Get-Step2() {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)][Object]$InputObject
    )
    begin {}
    process {}
    end {}
}

function Invoke-Part1($textinput) {
    $lines = $textinput.Split("`n")
    $i = 0
    $lines
    | Get-Step2
    | Get-Step3
}

Invoke-Part1 -textinput $textinput