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
    A short one-line action-based description, e.g. 'Tests if a function is valid'
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    ".\myfile" | Get-FileSize
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

#Requires -Version 7.0

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

#region Function Definition
function Get-LowerCase {
    [CmdletBinding()]
    param (
        # [Parameter(Mandatory, HelpMessage="Enter text")]
        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Text
    )
    process {
        $Text.ToLower()
    }
}
#endregion

#region Main Logic
try {
    $WordList = Get-Content ".\myList.txt" -ErrorAction Stop

    foreach ($Word in $WordList) {
        $Word | Get-LowerCase
    }
}
catch {
    Write-Error "$($_.Exception.Message)"
}
#endregion

