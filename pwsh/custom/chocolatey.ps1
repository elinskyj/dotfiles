<#
.SYNOPSIS
    This script imports the Chocolatey profile to enable tab-completions for the `choco` command in PowerShell.
    It is intended to be imported by the main PowerShell profile script (profile.ps1).
.DESCRIPTION
    The Chocolatey profile contains the necessary code to enable tab-completions for the `choco` command.
    If this script is not imported in your PowerShell profile, tab-completion for `choco` will not function.
.LINK
    https://ch0.co/tab-completion.
#>

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}