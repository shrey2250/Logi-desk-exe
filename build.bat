@echo off
setlocal
echo ========================================================
echo   LogiDesk - Standalone Windows Executable Builder
echo ========================================================
cd /d "%~dp0"

if not exist ".venv" (
    echo [*] Creating virtual environment (.venv)...
    python -m venv .venv
    if errorlevel 1 (
        echo [!] Error creating virtual environment. Ensure Python is installed.
        pause
        exit /b 1
    )
)

echo [*] Activating virtual environment...
call .venv\Scripts\activate.bat

echo [*] Installing / upgrading dependencies...
pip install -r requirements.txt
if errorlevel 1 (
    echo [!] Dependency installation failed.
    pause
    exit /b 1
)

echo [*] Compiling LogiDesk.exe with PyInstaller...
pyinstaller --clean LogiDesk.spec
if errorlevel 1 (
    echo [!] PyInstaller build failed.
    pause
    exit /b 1
)

if exist "dist\LogiDesk.exe" (
    echo.
    echo [SUCCESS] LogiDesk.exe built successfully in dist\LogiDesk.exe!
    copy /y "dist\LogiDesk.exe" "LogiDesk.exe" > NUL
    echo [INFO] Copied to project root: LogiDesk.exe
)
echo.
pause
