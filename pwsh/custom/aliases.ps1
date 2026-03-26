<#
.SYNOPSIS
    Custom aliases for PowerShell.
.DESCRIPTION
    This script defines custom aliases for PowerShell commands. It is intended to be imported by the main PowerShell profile script (profile.ps1).
.NOTES
    To see the available aliases, use the Get-Alias cmdlet.
#>

Set-Alias -Name vi -Value nvim
Set-Alias -Name so -Value Import-Profile
