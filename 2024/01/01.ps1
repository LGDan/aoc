Get-Content ./01-input.txt
|% -Begin {
    $1=[System.Collections.ArrayList]::new()
    $2=[System.Collections.ArrayList]::new()
} -Process {
        $split=$_.Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)
        [void]$1.Add($split[0])
        [void]$2.Add($split[1])
} -End {
    $1s = $1|Sort-Object
    $2s = $2|Sort-Object
    0..999
    |%{
        [System.Math]::Abs($1s[$_]-$2s[$_])
    }
}
| Measure-Object -Sum