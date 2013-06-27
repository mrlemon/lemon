@echo off
echo [INFO] Install gcxx-admin-webapp to local repository.

cd %~dp0
call mvn clean install -Dmaven.test.skip=true
pause