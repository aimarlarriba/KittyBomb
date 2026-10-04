@echo off
setlocal enabledelayedexpansion

echo ========================================================
echo             Building KittyBomb Executable JAR
echo ========================================================

where javac >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 'javac' not found. Please add JDK to PATH.
    pause
    exit /b 1
)

where jar >nul 2>nul
if %errorlevel% neq 0 (
    set "JAR_CMD=C:\Program Files\Java\jdk-21\bin\jar.exe"
    if not exist "!JAR_CMD!" (
        echo [ERROR] 'jar' command not found.
        pause
        exit /b 1
    )
) else (
    set "JAR_CMD=jar"
)

if not exist "bin" mkdir "bin"

echo [*] Compiling sources...
dir /s /b "src\*.java" > sources.tmp
javac -encoding UTF-8 -d bin @sources.tmp
del sources.tmp >nul 2>nul

echo [*] Copying assets...
xcopy /E /I /Y "src\viewController\Imagenes" "bin\viewController\Imagenes" >nul 2>nul
xcopy /E /I /Y "src\viewController\Objetos" "bin\viewController\Objetos" >nul 2>nul
xcopy /E /I /Y "src\viewController\Bomberman" "bin\viewController\Bomberman" >nul 2>nul

echo [*] Packaging KittyBomb.jar...
"!JAR_CMD!" cfe KittyBomb.jar main.main -C bin .

if exist "KittyBomb.jar" (
    echo.
    echo [SUCCESS] KittyBomb.jar successfully created!
    echo You can now launch it by running: java -jar KittyBomb.jar
) else (
    echo [ERROR] Failed to package KittyBomb.jar.
)

if "%~1"=="" if not defined CI pause
endlocal
