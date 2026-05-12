@echo off
md "%~dp0\..\.vscode"
md "%~dp0\..\.log"
xcopy /Y /E "%~dp0—› æ\œÓƒø≈‰÷√\*" "%~dp0.."
move "%~dp0.codemaker" "%~dp0..\..\..\.codemaker"
pause
