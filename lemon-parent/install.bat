@echo off
echo [INFO] Install project to local repository.

cd %~dp0
call mvn clean install -Dmaven.test.skip=true
pause