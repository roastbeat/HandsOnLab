# Hands-On Lab: Fail Safely
# Outcome: Convert a brittle script into one that reports errors predictably.
#
# 1. Attempt to read a file that does not exist with Get-Content.
# 2. Repeat with -ErrorAction Stop inside a try block.
# 3. In catch, print the exception type and message.
# 4. Add a finally block that logs a cleanup message
#
# Success check: You understand the difference between non-terminating
# and terminating errors and can force a ctach when needed.
#
# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

# Rename value to test the Try / Catch functionality
$dataset = ".\mydata.txt"
# $dataset = $null

try {
    # To catch the error, it needs the ErrorAction here!
    Get-Content $dataset -ErrorAction Stop
    Write-Host "All items have been processed" -ForegroundColor Green
}
# Specific error catch
catch [System.Management.Automation.ItemNotFoundException]{
    Write-Error "File is missing."
}
# Generic error catch
catch {
    Write-Error "Unexpected error: $($_.Exception.Message)"
}
# Runs always, no matter if error gets thrown or not
finally {
    Write-Host "Script finished." -ForegroundColor Cyan
}