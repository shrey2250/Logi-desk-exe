@echo off
cd /d "%~dp0"
echo ========================================================
echo   Pushing LogiDesk to GitHub (shrey2250/Logi-desk-exe)
echo ========================================================
echo.
git push -u origin main
echo.
echo [*] Pushing version tags...
git push origin --tags
echo.
echo ========================================================
echo   Done! Your repository and release are now on GitHub.
echo ========================================================
pause
