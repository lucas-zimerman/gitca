@echo off
REM gitca - Git Co-Author script for AI assistants

if "%~1"=="" (
    echo Error: No AI tool specified.
    echo.
    goto usage
)

if /i "%~1"=="chatgpt" (
    set CO_AUTHOR=ChatGPT ^<noreply@chatgpt.com^>
    goto amend
)
if /i "%~1"=="claude" (
    set CO_AUTHOR=Claude ^<noreply@anthropic.com^>
    goto amend
)
if /i "%~1"=="cursor" (
    set CO_AUTHOR=Cursor ^<cursoragent@cursor.com^>
    goto amend
)

echo Error: Invalid option '%~1'.
echo.
goto usage

:amend
set TMPFILE=%TEMP%\gitca_msg_%RANDOM%.txt
git log -1 --pretty=%%B > "%TMPFILE%"
echo. >> "%TMPFILE%"
echo Co-authored-by: %CO_AUTHOR% >> "%TMPFILE%"
git commit --amend -F "%TMPFILE%"
del "%TMPFILE%"
echo Commit amended with co-author: %CO_AUTHOR%
goto :eof

:usage
echo Usage: gitca ^<ai-tool^>
echo.
echo Amends the current git commit with an AI co-author attribution.
echo.
echo Available options:
echo   chatgpt
echo   claude
echo   cursor
exit /b 1
