<#
.SYNOPSIS
    Custom PSReadLine options and key handlers for PowerShell.
.DESCRIPTION
    This script defines custom options and key handlers for PSReadLine, the command-line editing module.
    It is intended to be imported by the main PowerShell profile script (profile.ps1).
.NOTES
    To see the available options and key handlers, refer to the PSReadLine documentation or use the following commands:
        Get-PSReadLineOption
        Get-PSReadLineKeyHandler
#>

$PSReadLineOptions = @{
    EditMode            = 'Vi'
    ViModeIndicator     = 'Cursor'
    PredictionViewStyle = 'InlineView'
}

$PSReadLineKeyHandlers = @(
    [ordered]@{ Chord = 'Ctrl+Alt+h';    Function = 'ShowCommandHelp' }
    [ordered]@{ Chord = 'Ctrl+Spacebar'; Function = 'AcceptSuggestion' }
    [ordered]@{ Chord = 'Ctrl+l';        Function = 'AcceptNextSuggestionWord' }
    [ordered]@{ Chord = 'Ctrl+p';        Function = 'PreviousHistory' }
    [ordered]@{ Chord = 'Ctrl+n';        Function = 'NextHistory' }
    [ordered]@{ Key   = 'Tab';           Function = 'TabCompleteNext' }
)

Set-PSReadLineOption @PSReadLineOptions

foreach ($handler in $PSReadLineKeyHandlers) {
    switch ($handler.Keys) {
        "Chord" {
            Set-PSReadLineKeyHandler -Chord $handler.Chord -Function $handler.Function
        }
        "Key" {
            Set-PSReadLineKeyHandler -Key $handler.Key -Function $handler.Function
        }
    }
}
