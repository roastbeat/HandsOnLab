# Hands-On Lab: Scope with intent
# Outcome: Keep dataflow explicit so your functions stay testable and reusable.
#
# 1. Create one local variable, and one private variable.
# 2. Build a script block that uses a captured variable from the parent scope.
# 3. Dot-source a helper script or import a lightweight module.
# 4. Refactor one example to remove an unnecessary global variable.
#
# Success check: You know where a variable should live and can explain the tradeoff
# of broad versus narrow scope.

# (c) Learn PowerShell Version 1.0.9 Offline Course App

# -----------------------------------------------------

<#
.SYNOPSIS
    # TODO
.DESCRIPTION
    # TODO
.NOTES
    # TODO
.EXAMPLE
    # TODO
#>

#Requires -Version 7.0

Set-StrictMode -Version Latest

# Shows all system messages in English
[System.Threading.Thread]::CurrentThread.CurrentUICulture = 'en-US'

