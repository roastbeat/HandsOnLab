# Hands-On Lab: Loop the Right Way
# Outcome: Match the loop construct to the data shape and execution model.
#
# 1. Use foreach to inspect an in-memory array of services or filenames.
# 2. Use ForEach-Object in a pipeline that streams process or file data.
# 3. Build a for loop that generates five counters or filenames.
# 4. Add break or continue intentionally and verify the changed behavior.
#
# Success check: You can explain why a loop was chosen instead of copying 
# a pattern from memory.
#
# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

$FilePath = ".\mydata.txt"

if (-not (Test-Path $FilePath)) {
    Write-Warning "Path does not exist, try again"
    return
}

try {
    $Data = Get-Content $FilePath -ErrorAction Stop
    # Write-Host $Data -ForegroundColor Cyan
    for ($i = 0; $i -lt $Data.Count; $i++) {
        Write-Host "$($i + 1). $($Data[$i])" -ForegroundColor Magenta
    }
}
catch [System.IO.FileNotFoundException] {
    Write-Host "Missing file"
}
finally {
    Write-Host "Script finished"
}

