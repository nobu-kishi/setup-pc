@echo off
setlocal

set "OPTION=--source winget --silent --disable-interactivity --accept-package-agreements --accept-source-agreements"

echo "Starting..."
:: winget
winget install --id 7zip.7zip %OPTION%
winget install --id Amazon.AWSCLI %OPTION%
winget install --id Anthropic.ClaudeCode %OPTION%
winget install --id AutoHotkey.AutoHotkey %OPTION%
winget install --id Git.Git %OPTION%
winget install --id Google.Chrome %OPTION%
winget install --id junegunn.fzf %OPTION%
winget install --id SoftwareOK.Q-Dir %OPTION%
winget install --id VideoLAN.VLC %OPTION%
winget install --id jdx.mise %OPTION%
winget install --id sakura-editor.sakura %OPTION%

:: autohotkey
copy /Y "%~dp0jis-to-us.ahk" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\jis-to-us.ahk"

:: mise
:: Install and set global version at once (run without -g to set per project)
mise use -g bun@latest
mise use -g python@latest
mise use -g java@corretto-21
mise use -g go@latest
mise use -g terraform@latest
mise use -g uv@latest

echo "Done."
endlocal