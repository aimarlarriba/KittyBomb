@echo off
setlocal enabledelayedexpansion

echo ========================================================
echo               Launching KittyBomb...
echo ========================================================

:: Check for Java installation
where javac >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 'javac' was not found in your PATH.
    echo Please install Java JDK 17+ and add it to your system PATH.
    pause
    exit /b 1
)

where java >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 'java' was not found in your PATH.
    echo Please install Java JRE/JDK and add it to your system PATH.
    pause
    exit /b 1
)

:: Create bin folder if it does not exist
if not exist "bin" mkdir "bin"

echo [*] Compiling Java source files...
:: Find all Java sources
dir /s /b "src\*.java" > sources.tmp
javac -encoding UTF-8 -d bin @sources.tmp
if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed.
    del sources.tmp >nul 2>nul
    pause
    exit /b 1
)
del sources.tmp >nul 2>nul

echo [*] Synchronizing assets...
xcopy /E /I /Y "src\viewController\Imagenes" "bin\viewController\Imagenes" >nul 2>nul
xcopy /E /I /Y "src\viewController\Objetos" "bin\viewController\Objetos" >nul 2>nul
xcopy /E /I /Y "src\viewController\Bomberman" "bin\viewController\Bomberman" >nul 2>nul

echo [*] Starting KittyBomb!
java -cp bin main.main

endlocal
