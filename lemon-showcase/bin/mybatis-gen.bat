@echo off
@echo [INFO] mybatis generator begining...
cd %~dp0
cd ..
call mvn -Dmybatis.generator.overwrite=false mybatis-generator:generate
@echo [INFO] mybatis generator success!
pause