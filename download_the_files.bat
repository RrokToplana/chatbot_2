@echo off
setlocal enabledelayedexpansion

REM --- Config ---
set KEY_PATH=key-instance.pem
set EC2_USER=ubuntu
set EC2_IP=18.233.150.43
set REMOTE_FOLDER=/home/ubuntu/heartMatch/download

REM --- Loop from 1 to 1000 ---
for /L %%i in (1,1,1000) do (
    set "FOLDER_NAME=download%%i"
    if not exist "!FOLDER_NAME!" (
        echo Downloading to !FOLDER_NAME!...
        scp -r -i %KEY_PATH% %EC2_USER%@%EC2_IP%:%REMOTE_FOLDER% "!FOLDER_NAME!"
        if %ERRORLEVEL% neq 0 (
            echo ❌ Download failed.
        ) else (
            echo ✅ Download complete.
        )
        goto :EOF
    )
)

echo ⚠️ No available folder name found from download1 to download1000.
