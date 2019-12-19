@echo off
set PROJ_ROOT=%~dp0
set LUA_ROOT=%PROJ_ROOT%\lua534
set SWIG_ROOT=%PROJ_ROOT%\swig
set TEST_ROOT=%PROJ_ROOT%\test

copy %LUA_ROOT%\build\lib\lua5.3.4.dll %TEST_ROOT%\LuaNative.dll

cd /d %TEST_ROOT%

csc %TEST_ROOT%\test.cs %SWIG_ROOT%\cs\*.cs /platform:x86 /target:exe
test.exe

echo "done"

cd /d %PROJ_ROOT%
