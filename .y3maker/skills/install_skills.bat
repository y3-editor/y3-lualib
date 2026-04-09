@echo off
setlocal enabledelayedexpansion

echo ====================================
echo    Claude Skills Installer
echo ====================================
echo.

REM 获取用户主目录
set "USER_HOME=%USERPROFILE%"
set "CLAUDE_DIR=%USER_HOME%\.claude"
set "SKILLS_SOURCE_DIR=%~dp0"

echo 源文件夹: %SKILLS_SOURCE_DIR%
echo 目标文件夹: %CLAUDE_DIR%
echo.

REM 创建 .claude 目录（如果不存在）
if not exist "%CLAUDE_DIR%" (
    echo 创建目录: %CLAUDE_DIR%
    mkdir "%CLAUDE_DIR%"
)

REM 创建 skills 子目录（如果不存在）
if not exist "%CLAUDE_DIR%\skills" (
    echo 创建目录: %CLAUDE_DIR%\skills
    mkdir "%CLAUDE_DIR%\skills"
)

echo.
echo 开始安装技能...
echo.

REM 遍历当前目录下的所有文件夹（除了install_skills.bat所在的目录）
for /d %%i in ("%SKILLS_SOURCE_DIR%*") do (
    set "SKILL_NAME=%%~nxi"
    set "SOURCE_PATH=%%i"
    set "TARGET_PATH=%CLAUDE_DIR%\skills\!SKILL_NAME!"
    
    echo 正在安装技能: !SKILL_NAME!
    
    REM 如果目标目录已存在，先删除
    if exist "!TARGET_PATH!" (
        echo   - 删除旧版本: !TARGET_PATH!
        rmdir /s /q "!TARGET_PATH!"
    )
    
    REM 复制技能文件夹
    echo   - 复制文件: !SOURCE_PATH! -^> !TARGET_PATH!
    xcopy "!SOURCE_PATH!" "!TARGET_PATH!\" /e /i /h /y > nul
    
    if !errorlevel! equ 0 (
        echo   - ✓ 安装成功: !SKILL_NAME!
    ) else (
        echo   - ✗ 安装失败: !SKILL_NAME!
    )
    echo.
)

echo ====================================
echo 技能安装完成！
echo.
echo 已安装的技能位置: %CLAUDE_DIR%\skills
echo.
echo 你可以在 Claude 中使用这些技能了。
echo ====================================
echo.

pause