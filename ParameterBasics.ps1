# Hands-On Lab: Validate Input Up Front
# Outcome: Prevent bad data from entering your function in the first place.
#
# 1. Build a function with a mandatory path parameter and a ValidationScript check.
# 2. Add a ValidateSet environment parameter such as Dev, Test, or Prod.
# 3. Add a numeric parameter with ValidateRange.
# 4. Run the function with both valid and invalid inputs and inspect the error messages.
#
# Success check: Your function fails early with useful validation errors 
# instead of mysterious runtime behaviour.

# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

<#
.SYNOPSIS

.DESCRIPTION

#>

#Requires -Version 7.0

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'
