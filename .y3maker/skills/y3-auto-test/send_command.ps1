# send_command.ps1 - 从 VSCode 终端发送命令到管理员守护进程
# 用法：
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\send_command.ps1 -Action mouse-click -Button left
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\send_command.ps1 -Action mouse-click -X 500 -Y 300 -Button left
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\send_command.ps1 -Action mouse-move -X 500 -Y 300
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\send_command.ps1 -Action mouse-drag -X 100 -Y 200 -EndX 500 -EndY 600
#   powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\send_command.ps1 -Action ping

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("mouse-move", "mouse-click", "mouse-drag", "key", "ping")]
    [string]$Action,

    [int]$X,
    [int]$Y,
    [int]$EndX,
    [int]$EndY,

    [ValidateSet("left", "right", "middle", "double")]
    [string]$Button = "left",

    [string]$Key,

    [string]$QueueDir = ".\.codemaker\skills\desktop-automation\.queue",
    [int]$TimeoutMs = 5000
)

$ErrorActionPreference = "Stop"

$commandFile = Join-Path $QueueDir "command.json"
$resultFile  = Join-Path $QueueDir "result.json"
$readyFile   = Join-Path $QueueDir ".ready"

# 检查守护进程是否就绪
if (-not (Test-Path $readyFile)) {
    Write-Error "Admin daemon is not running! Start it first in an admin PowerShell:`n  cd $PWD`n  powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\desktop-automation\admin_daemon.ps1"
    exit 1
}

# 清理旧的结果文件
Remove-Item -Path $resultFile -ErrorAction SilentlyContinue

# 构建命令
$cmd = @{ action = $Action }

if ($PSBoundParameters.ContainsKey("X"))    { $cmd.x = $X }
if ($PSBoundParameters.ContainsKey("Y"))    { $cmd.y = $Y }
if ($PSBoundParameters.ContainsKey("EndX")) { $cmd.endX = $EndX }
if ($PSBoundParameters.ContainsKey("EndY")) { $cmd.endY = $EndY }
if ($PSBoundParameters.ContainsKey("Button")) { $cmd.button = $Button }
if ($PSBoundParameters.ContainsKey("Key"))  { $cmd.key = $Key }

# 写入命令文件
$cmd | ConvertTo-Json -Compress | Out-File -FilePath $commandFile -Encoding utf8 -Force

# 等待结果
$elapsed = 0
while ($elapsed -lt $TimeoutMs) {
    if (Test-Path $resultFile) {
        $result = Get-Content -Path $resultFile -Raw -Encoding utf8 | ConvertFrom-Json
        Remove-Item -Path $resultFile -Force -ErrorAction SilentlyContinue

        if ($result.success) {
            Write-Host $result.message
        } else {
            Write-Error "Command failed: $($result.message)"
            exit 1
        }
        exit 0
    }
    Start-Sleep -Milliseconds 100
    $elapsed += 100
}

Write-Error "Timeout waiting for daemon response (${TimeoutMs}ms)"
exit 1
