@echo off

if exist windows\trs80gp.exe goto TRS80GP_OK
echo :: Downloading TRS80GP ::
gettrs80gp.sh
if errorlevel 1 pause && goto :eof
:TRS80GP_OK

echo :: Starting the emulator ::
set FUZIX=mount\FUZIX\Images\trs80
windows\trs80gp.exe -m4ga -gt -d %FUZIX%\boot.jv3 -h0 %FUZIX%\hard4p-0 -vs -win full
