@echo off
REM Fix for TrustLicenceServiceProvider not found error
REM Run this script on your Windows server after pulling the latest code

echo Fixing composer autoload issues...

REM Navigate to the Application directory
cd Application

REM Regenerate composer autoload files
echo Regenerating composer autoload files...
composer dump-autoload

echo Fix completed successfully!
echo The TrustLicenceServiceProvider should now be properly loaded.
pause
