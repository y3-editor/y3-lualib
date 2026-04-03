param(
    [int]$X = -1,
    [int]$Y = -1,
    [ValidateSet("left", "right", "double")]
    [string]$Button = "left",
    [double]$Delay = 2.0,
    [switch]$WaitEnter
)

Add-Type @"
using System;
using System.Runtime.InteropServices;

public static class MouseNative
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);
}
"@

$MOUSEEVENTF_LEFTDOWN  = 0x0002
$MOUSEEVENTF_LEFTUP    = 0x0004
$MOUSEEVENTF_RIGHTDOWN = 0x0008
$MOUSEEVENTF_RIGHTUP   = 0x0010

function Move-Mouse {
    param(
        [int]$TargetX,
        [int]$TargetY
    )

    $ok = [MouseNative]::SetCursorPos($TargetX, $TargetY)
    if (-not $ok) {
        throw "SetCursorPos failed."
    }
}

function Invoke-Click {
    param([string]$ClickButton)

    switch ($ClickButton) {
        "left" {
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
        }
        "right" {
            [MouseNative]::mouse_event($MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, [UIntPtr]::Zero)
            [MouseNative]::mouse_event($MOUSEEVENTF_RIGHTUP, 0, 0, 0, [UIntPtr]::Zero)
        }
        "double" {
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
            Start-Sleep -Milliseconds 80
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
            [MouseNative]::mouse_event($MOUSEEVENTF_LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
        }
    }
}

if (($X -ge 0 -and $Y -lt 0) -or ($X -lt 0 -and $Y -ge 0)) {
    throw "You must provide both -X and -Y, or neither."
}

if ($WaitEnter) {
    Write-Host "Press Enter to execute..."
    [void][System.Console]::ReadLine()
}
else {
    Write-Host ("Starting in {0:N1}s..." -f $Delay)
    Start-Sleep -Milliseconds ([int]($Delay * 1000))
}

if ($X -ge 0 -and $Y -ge 0) {
    Move-Mouse -TargetX $X -TargetY $Y
    Start-Sleep -Milliseconds 50
}

Invoke-Click -ClickButton $Button

Write-Host "Done."
