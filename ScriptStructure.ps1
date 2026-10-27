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

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

#Requires -Version 7.0
<#
.SYNOPSIS
  Short description (What the script does)
  .DESCRIPTION
  Explain in detail, what the script does
#>

#region Configuration
# Import data, paths, files here and check if they're valid.
#endregion


#region Main Logic
# Here is where the main logic goes after the input was checked valid!
#endregion


#region Output
# Optional
#endregion



