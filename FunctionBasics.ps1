# Hands-On Lab: Replace Copy-Paste with a function
# Outcome: Wrap a repeated logic in a function that behaves 
# like a first-class PowerShell command.
#
# 1. Choose a repeated task such as formatting timestamps 
#    or checking file existence.
# 2. Put it in a Verb-Noun function with [CmdletBinding()].
# 3. Return structured output instead of mixing data with status text.
# 4. Call the function directly and through the pipeline if appropriate.
#
# Success check: You can point to one concrete place where a function
# made later changes easier.
#
# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

<#
.SYNOPSIS
Validates any file hash and writes the result to the console
.DESCRIPTION
Takes a source path, the algorithm and the source hash as argument and checks if the hashes are equal.
The function writes the result to the console.
#>

#Requires -Version 7.0

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

#region Hash Check
function Get-FileValidation  {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, HelpMessage="Enter path to file")]
        [string]$SourcePath,

        [Parameter(HelpMessage="Enter hash algorithm (default is SHA256)")]
        [string]$Algorithm = "SHA256",

        [Parameter(Mandatory, HelpMessage="Enter hash value from vendor")]
        [string]$SourceHash
    )

    $Result = $false

    try {
        $FileHash = Get-FileHash -Algorithm $Algorithm -Path $SourcePath -ErrorAction Stop
        $Result = $FileHash.Hash.ToLower() -eq $SourceHash.ToLower()
        return $Result
    }
    catch {
         Write-Host "An error occured: $($_.Exception.Message)"
    } 
}
#endregion

#region Output Creation
function Write-Result {
    [CmdletBinding()]
    param(
        [bool]$Result
    )
    
    if ($Result){
        Write-Host "+$('-' * 12)+" -ForegroundColor Green
        Write-Host "| File valid |" -ForegroundColor Green
        Write-Host "+$('-' * 12)+" -ForegroundColor Green
    } else {
        Write-Host "+$('-' * 14)+" -ForegroundColor Red
        Write-Host "| File corrupt |" -ForegroundColor Red
        Write-Host "+$('-' * 14)+" -ForegroundColor Red
    }
}
#endregion

#region Testing
# As soon as the text file contains new line symbols, the file will no longer get valid under Linux, text content was written in Windows!
$Value = Get-FileValidation -SourcePath .\mydata.txt -Algorithm SHA256 -SourceHash "E48FCFCE8DFE07D5AA94209E73AE60B3B0BC32DA2C9EEB07098A9EA15BBE828C"
Write-Result -Result $Value
#endregion
