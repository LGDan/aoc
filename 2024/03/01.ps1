$03input = Get-Content ./03-input.txt -Raw
$regexText = "mul\((\d+),(\d+)\)"
$regex = [System.Text.RegularExpressions.Regex]::new($regexText)
$regex.Matches($03input)
| ForEach-Object {
    [int]($_.Groups[1].Value) * [int]($_.Groups[2].Value)
} | Measure-Object -Sum