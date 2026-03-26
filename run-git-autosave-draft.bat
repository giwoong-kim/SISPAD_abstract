@echo off
setlocal
for /f "delims=" %%I in ('wsl.exe wslpath -a "%~dp0git-autosave-draft.sh"') do set "WSL_SCRIPT=%%I"
wsl.exe bash "%WSL_SCRIPT%"
