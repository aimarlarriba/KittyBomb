#!/usr/bin/env bash
set -e

echo "========================================================"
echo "              Launching KittyBomb..."
echo "========================================================"

if ! command -v javac &> /dev/null; then
    echo "[ERROR] 'javac' is not installed or not in PATH."
    echo "Please install Java JDK 17+."
    exit 1
fi

if ! command -v java &> /dev/null; then
    echo "[ERROR] 'java' is not installed or not in PATH."
    exit 1
fi

mkdir -p bin

echo "[*] Compiling Java source files..."
find src -name "*.java" > sources.tmp
javac -encoding UTF-8 -d bin @sources.tmp
rm -f sources.tmp

echo "[*] Synchronizing assets..."
mkdir -p bin/viewController/Imagenes bin/viewController/Objetos bin/viewController/Bomberman
cp -r src/viewController/Imagenes/* bin/viewController/Imagenes/ 2>/dev/null || true
cp -r src/viewController/Objetos/* bin/viewController/Objetos/ 2>/dev/null || true
cp -r src/viewController/Bomberman/* bin/viewController/Bomberman/ 2>/dev/null || true

echo "[*] Starting KittyBomb!"
java -cp bin main.main
