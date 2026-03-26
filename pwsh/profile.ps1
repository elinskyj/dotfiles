<#
.SYNOPSIS
    This is the PowerShell profile script. It is executed every time a new PowerShell session is started.
.DESCRIPTION
    This script sets up the PowerShell environment by importing custom configurations, defining aliases, and initializing the Oh My Posh prompt.
.NOTES
    To customize your PowerShell environment, you can add additional scripts to the 'custom' directory and they will be automatically imported.
    The Oh My Posh prompt is initialized with a specific theme configuration. You can change the theme by modifying the path in the init command.
#>

oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\powerlevel10k_rainbow.omp.json" | Invoke-Expression

$custom = Split-Path $profile | Join-Path -ChildPath 'custom'

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound

if (Test-Path -Path $custom) {
  foreach ($file in Get-ChildItem -Path $custom -Filter *.ps1) { . $file }
}
