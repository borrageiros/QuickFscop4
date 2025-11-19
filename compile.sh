#!/bin/bash
set -e

echo "[+] Building Docker image..."
docker build -t f4st-build .

echo "[+] Extracting compiled binaries..."
docker create --name f4st-temp f4st-build
docker cp f4st-temp:/build/bin ./bin 2>/dev/null || docker cp f4st-temp:/build/F4ST.exe ./F4ST.exe 2>/dev/null || true
docker rm f4st-temp

echo "[+] Build complete! Binaries are in ./bin/ or ./F4ST.exe"