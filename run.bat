@echo off
pushd %~dp0
set DIR=%CD%
set IMAGE=ubuntu-fuzix
set BRANCH=work
set CONTAINER=%IMAGE%.%BRANCH%
for /f "usebackq" %%I in (`docker ps -q -l -a -f name^=^^%CONTAINER%$`) do set ID=%%I
echo Container name: [%CONTAINER%] -- Container id: [%ID%]
if not "%ID%" == "" (
  docker start -a -i %ID%
) else (
  docker run -it --cpus 4 --memory 4g --name %CONTAINER% ^
  -v "%DIR%/mount:/mount" ^
  %IMAGE%:latest bash
)
if errorlevel 1 pause
