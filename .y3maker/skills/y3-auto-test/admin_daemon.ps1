#Requires -RunAsAdministrator
# admin_daemon.ps1 - 管理员权限守护进程
# 在手动打开的管理员 PowerShell 中运行，轮询监听命令并执行
#
# 启动方式（在管理员 PowerShell 中）：
#   cd E:\y3_ai\agentmap
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\admin_daemon.ps1
#
# 退出方式：Ctrl+C 或创建 .stop 文件

param(
    [string]$QueueDir = ".\.codemaker\skills\desktop-automation\.queue",
    [int]$PollIntervalMs = 200
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# 确保队列目录存在
if (-not (Test-Path $QueueDir)) {
    New-Item -ItemType Directory -Path $QueueDir -Force | Out-Null
}

$commandFile = Join-Path $QueueDir "command.json"
$resultFile  = Join-Path $QueueDir "result.json"
$stopFile    = Join-Path $QueueDir ".stop"
$readyFile   = Join-Path $QueueDir ".ready"

# 清理旧文件
Remove-Item -Path $commandFile -ErrorAction SilentlyContinue
Remove-Item -Path $resultFile -ErrorAction SilentlyContinue
Remove-Item -Path $stopFile -ErrorAction SilentlyContinue

# 预加载 mouse_event 和 SendInput
Add-Type -AssemblyName System.Windows.Forms
Add-Type -MemberDefinition @'
[DllImport("user32.dll")]
public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);

[DllImport("user32.dll", SetLastError=true)]
public static extern bool SetCursorPos(int X, int Y);
'@ -Name NativeInput -Namespace Admin

# 标记就绪
"ready" | Out-File -FilePath $readyFile -Encoding utf8 -Force

Write-Host "============================================"
Write-Host "  Admin Daemon started"
Write-Host "  Queue dir: $QueueDir"
Write-Host "  Poll interval: ${PollIntervalMs}ms"
Write-Host "  Waiting for commands..."
Write-Host "  Press Ctrl+C or create .stop file to exit"
Write-Host "============================================"

try {
    while ($true) {
        # 检查停止信号
        if (Test-Path $stopFile) {
            Write-Host "[Daemon] Stop signal received. Exiting."
            break
        }

        # 检查命令文件
        if (Test-Path $commandFile) {
            try {
                $rawContent = Get-Content -Path $commandFile -Raw -Encoding utf8
                $cmd = $rawContent | ConvertFrom-Json

                # 立即删除命令文件，防止重复执行
                Remove-Item -Path $commandFile -Force

                Write-Host "[Daemon] Received: $($cmd.action)"

                $result = @{ success = $true; message = ""; timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff") }

                switch ($cmd.action) {
                    "mouse-move" {
                        [Admin.NativeInput]::SetCursorPos($cmd.x, $cmd.y)
                        $result.message = "Moved to $($cmd.x),$($cmd.y)"
                    }
                    "mouse-click" {
                        if ($cmd.PSObject.Properties['x'] -and $cmd.PSObject.Properties['y']) {
                            [Admin.NativeInput]::SetCursorPos($cmd.x, $cmd.y)
                            Start-Sleep -Milliseconds 40
                        }
                        $button = if ($cmd.PSObject.Properties['button']) { $cmd.button } else { "left" }
                        switch ($button) {
                            "left" {
                                [Admin.NativeInput]::mouse_event(0x0002, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0004, 0, 0, 0, 0)
                            }
                            "right" {
                                [Admin.NativeInput]::mouse_event(0x0008, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0010, 0, 0, 0, 0)
                            }
                            "middle" {
                                [Admin.NativeInput]::mouse_event(0x0020, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0040, 0, 0, 0, 0)
                            }
                            "double" {
                                [Admin.NativeInput]::mouse_event(0x0002, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0004, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0002, 0, 0, 0, 0)
                                Start-Sleep -Milliseconds 40
                                [Admin.NativeInput]::mouse_event(0x0004, 0, 0, 0, 0)
                            }
                        }
                        $result.message = "Clicked $button"
                    }
                    "mouse-drag" {
                        $button = if ($cmd.PSObject.Properties['button']) { $cmd.button } else { "left" }
                        $downFlag = switch ($button) { "left" { 0x0002 } "right" { 0x0008 } "middle" { 0x0020 } }
                        $upFlag   = switch ($button) { "left" { 0x0004 } "right" { 0x0010 } "middle" { 0x0040 } }

                        [Admin.NativeInput]::SetCursorPos($cmd.x, $cmd.y)
                        Start-Sleep -Milliseconds 40
                        [Admin.NativeInput]::mouse_event($downFlag, 0, 0, 0, 0)
                        Start-Sleep -Milliseconds 40
                        [Admin.NativeInput]::SetCursorPos($cmd.endX, $cmd.endY)
                        Start-Sleep -Milliseconds 40
                        [Admin.NativeInput]::mouse_event($upFlag, 0, 0, 0, 0)
                        $result.message = "Dragged from $($cmd.x),$($cmd.y) to $($cmd.endX),$($cmd.endY)"
                    }
                    "key" {
                        # 使用 SendKeys 模拟按键
                        [System.Windows.Forms.SendKeys]::SendWait($cmd.key)
                        $result.message = "Key pressed: $($cmd.key)"
                    }
                    "ping" {
                        $result.message = "pong"
                    }
                    default {
                        $result.success = $false
                        $result.message = "Unknown action: $($cmd.action)"
                    }
                }

                Write-Host "[Daemon] Result: $($result.message)"

                # 写入结果
                $result | ConvertTo-Json -Compress | Out-File -FilePath $resultFile -Encoding utf8 -Force

            }
            catch {
                Write-Host "[Daemon] Error: $_"
                @{ success = $false; message = "$_"; timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff") } |
                    ConvertTo-Json -Compress |
                    Out-File -FilePath $resultFile -Encoding utf8 -Force
            }
        }

        Start-Sleep -Milliseconds $PollIntervalMs
    }
}
finally {
    # 清理就绪标记
    Remove-Item -Path $readyFile -ErrorAction SilentlyContinue
    Write-Host "[Daemon] Stopped."
}
