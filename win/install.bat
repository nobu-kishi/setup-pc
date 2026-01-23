@echo off
setlocal

set "OPTION=--source winget --silent --disable-interactivity --accept-package-agreements --accept-source-agreements"

echo "Starting..."
:: winget
winget install --id 7zip.7zip %OPTION%
winget install --id Amazon.AWSCLI %OPTION%
winget install --id Git.Git %OPTION%
winget install --id SoftwareOK.Q-Dir %OPTION%
winget install --id VideoLAN.VLC %OPTION%
winget install --id jdx.mise %OPTION%
winget install --id sakura-editor.sakura %OPTION%

:: mise
mise install python@3.14.2
mise use -g pythohn@3.14.2
mise install java@temurin-21.0.9+10.0.LTS
mise use -g java@temurin-21.0.9+10.0.LTS
mise install terraform@1.14.3
mise use -g terraform@1.14.3

echo "Done."
endlocal