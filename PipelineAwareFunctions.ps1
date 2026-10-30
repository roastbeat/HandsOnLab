# Hands-On Lab: Stream Pipeline Input
# Outcome: Build a function that works naturally in a PowerShell pipeline.
# 
# 1. Create a function that accepts pipeline input with ValueFromPipeline.
# 2. Use begin to initialize state, process to transform each item, and end to summarize.
# 3. Pipe at least three values into the function
# 4. Confirm the function still works when called without a pipeline by using an explicit parameter.
#
# Success check: You can describe what happens once, per item, and after completion 
# in a pipeline-aware function.

# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

<#
.SYNOPSIS
    #TODO
.DESCRIPTION
    #TODO
.NOTES
    #TODO
.EXAMPLE
    #TODO
#>

#Requires -Version 7.0

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

function Invoke-InputStream {
  [CmdletBinding()]
  param(
    [parameter(ValueFromPipeline)]$Value
  )

  begin {
    
  }
  process {
    
  }
  end {
    
  }
}