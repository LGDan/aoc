Get-Content ./01-input.txt
|% -Begin {
    $1=[System.Collections.ArrayList]::new()
    $2=[System.Collections.ArrayList]::new()
} -Process {
        $split=$_.Split(" ",[System.StringSplitOptions]::RemoveEmptyEntries)
        [void]$1.Add($split[0])
        [void]$2.Add($split[1])
} -End {
    $2g = $2 
    | Group-Object 
    | % -Begin {$ht=@{}} -Process {[void]$ht.Add($_.Name,$_.Count)} -End {$ht}

    $1
    | % {
        ($2g[$_] ?? 0) * $_
    }
}
| Measure-Object -Sum