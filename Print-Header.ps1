# Refactor this into a utils module!!

param(
    [CmdletBinding()]
    [Parameter(ValueFromPipeline)]
    [string]$Text
)

[int]$TotalLength = $Text.Length + 4

function TopAndBottom {
    for ($i = 0; $i -lt $TotalLength; $i++) {
        if ($i -eq 0 -or $i -eq $TotalLength-1 ){
            Write-Host "+" -NoNewline
        } else {
            Write-Host "-" -NoNewline
        }
    }
    Write-Host ""
}

function Headline {
    TopAndBottom $Text
    Write-Host '|' $Text '|'
    TopAndBottom $Text
}

Headline



