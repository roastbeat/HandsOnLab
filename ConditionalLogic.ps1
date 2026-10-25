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
$path = Read-Host("Set path")
$env = Read-Host("Set environment name [dev | test | prod]")

# Guard clause
if (-not (Test-Path $path)){
  Write-Warning "Missing path" 
} elseif ($env -eq "") {
  Write-Warning "No environment name set"
}


