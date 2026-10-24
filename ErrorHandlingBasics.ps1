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


# Your code starts here!

