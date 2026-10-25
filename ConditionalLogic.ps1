# Hands-On Lab: Route Decisions Cleanly
# Outcome: Learn to choose the branch style that makes the script's 
# intent easiest to understand.
# 
# Scenario: you are writing a deployment helper that accepts an
# environment name and an input file path.
# 
# 1. Add a guard clause that stops the script when the file path does not exist.
# 2. Write if/elseif/else logic that changes behavior based on a numeric risk score.
# 3. Write switch logic that routes dev, test, and prod to different messages or actions.
# 4. Run the script with both valid and invalid inputs and note which branch 
#    was easiest to reason about.
# 
# Success check: You can explain not only what branch executed, but why that 
# branching style was the clearest choice. 
# 
# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'


# Requesting for user data --> path and environment name
$path = Read-Host("Set path [ . ]") # Use dot for current directory --> easiest valid path to test script 
$env = Read-Host("Set environment name [dev | test | prod]")
$riskScore = [Int32](Read-Host("Set risk score [10 (low risk) - 100 (max. risk)]"))


# Guard clause
if (-not (Test-Path $path)){
  Write-Warning "Missing path, try again" 
  return
} elseif ($env -eq "") {
  Write-Warning "No environment name set, try again"
  return
} 

# Logic of risk score
if ($riskScore -ge [Int32]10 -and $riskScore -le [Int32]30) {
  Write-Host "Risk low, let's go" -ForegroundColor Green
} elseif ($riskScore -gt [Int32]30 -and $riskScore -le [Int32]60) {
  Write-Host "Middle risk detected. Be aware of further actions" -ForegroundColor DarkYellow
} elseif ($riskScore -gt [Int32]60 -and $riskScore -le [int32]100) {
  Write-Host "Risk too high, action CANCELED!" -ForegroundColor DarkRed
  return
} elseif ($riskScore -gt [Int32]100) {
  Write-Warning "Risk score cannot be larger than 100%! Try again"
  return
} else {
  Write-Warning "Risk score cannot be lower than 10. Current value '$($riskScore)', try again"
  return
}

# Cases for the environment and its assigned message
switch ($env) {
  "dev" { 
    Write-Host "[DEV] Running dev pipeline..." -ForegroundColor Cyan
   }
   "test" { 
    Write-Host "[TEST] Running tests..." -ForegroundColor Cyan 
   }
   "prod" { 
    Write-Host "[PROD] Running production build..." -ForegroundColor Cyan 
   }
  Default {
    Write-Warning "No matching environment name found"
  }
}