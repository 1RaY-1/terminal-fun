#!/usr/bin/pwsh

<#
Simple PowerShell script that will change background colors of your terminal in random order, until you don't stop it with CTRL + C.
#>

$all_colors = @(
"DarkBlue", "Black", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray"
"DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White"
)

function fun {
    foreach ($each_color in $all_colors) {
        $each_color = Get-Random -InputObject $all_colors # <-- let this line if you wanna choose colors in random order (or remove it if don't want to)
        $Host.UI.RawUI.BackgroundColor = ($bckg = $each_color)
        $Host.UI.RawUI.ForegroundColor = $bckg
        clear
        Start-Sleep -Seconds 0.6 # <-- delay before changing color
    }
    
}


function main {
    try {
        while ($true) {
            fun
        }
    }
    finally {
        # reset terminal colors and exit program
        [console]::ResetColor()
        clear
        exit
    }

}

main
