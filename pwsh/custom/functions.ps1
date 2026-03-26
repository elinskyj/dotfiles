<#
.SYNOPSIS
    This script defines custom functions for PowerShell. It is intended to be imported by the main PowerShell profile script (profile.ps1).
.NOTES
    To use these functions, simply import this script in your profile.ps1 or run it in your PowerShell session.
    You can also add additional functions to this script as needed.
#>


Function Import-Profile {
    . $profile
    <# .SYNOPSIS
        Imports the PowerShell profile script. This function allows you to reload your profile without restarting the PowerShell session.
    #>
}

Function q {
    exit
    <# .SYNOPSIS
        Quits the current PowerShell session.
    #>
}
