@echo off

if exist windows\trs80gp.exe goto TRS80GP_OK
echo :: Downloading TRS80GP ::
gettrs80gp.sh
if errorlevel 1 pause && goto :eof
:TRS80GP_OK

echo :: Starting the emulator ::
echo.
echo - Note: Now the BOOTDEV is 2
set FUZIX=mount\FUZIX\Images\trs80
windows\trs80gp.exe -m4p -gt -h0 %FUZIX%\hard4p-0 -vs -win full
