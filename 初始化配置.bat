@echo off
xcopy /Y "%~dp0演示\项目配置\extensions.json" "%~dp0..\.vscode\extensions.json"
xcopy /Y "%~dp0演示\项目配置\launch.json" "%~dp0..\.vscode\launch.json"
xcopy /Y "%~dp0演示\项目配置\luarc.json" "%~dp0..\.luarc.json"
cd "%~dp0/.."
md log
pause
