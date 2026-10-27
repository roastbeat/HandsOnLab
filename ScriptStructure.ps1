# Hands-On Lab: Refactor a Script Skeleton
# Outcome: Organize a small script so another engineer could read it quickly.
#
# 1. Create a script with a parameter block, validation, and one helper function.
# 2. Add comment-based help at the top or to the public function.
# 3. Add 'Set-StrictMode -Version Latest' and a guard clause for bad input.
# 4. Make the script output one useful object instead of only writing text.
#
# Success check: Your script has a clear entry point, predictable input, handling,
# and output another command could consume.
#
# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

#Requires -Version 7.0

<#
.SYNOPSIS
Writes content from file into an object.
.DESCRIPTION
Imports data from a file and creates an object with the content.
#>

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

#region Configuration
$DefaultPath = ".\mydata.txt"

$FilePath = Read-Host("Set the path")

# Guard clause, where a default file when path is missing
if ( -not (Test-Path $FilePath)) {
  Write-Host "Path does not exist, default is used." -ForegroundColor Cyan
  $FilePath = $DefaultPath
}

$Content = Get-Content $FilePath
#endregion

#region Main Logic
$Output = @($Content)
#endregion

#region Output
Write-Host $Output -ForegroundColor Green
#endregion