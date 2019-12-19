@echo off
set SWIG_BIN=%1
if not exist %SWIG_BIN% goto :NOSWIG

set PROJ_ROOT=%~dp0
set LUA_ROOT=%PROJ_ROOT%\lua534
set SWIG_ROOT=%PROJ_ROOT%\swig

set SWIG_SRC=%SWIG_ROOT%\src
set SWIG_CS=%SWIG_ROOT%\cs

if not exist %SWIG_CS% md %SWIG_CS%
if not exist %SWIG_SRC% md %SWIG_SRC%

if exist %SWIG_SRC%\LuaNative_wrap.c (
    del /Q /S /F %SWIG_SRC%\LuaNative_wrap.c
)

%SWIG_BIN% -csharp -outdir %SWIG_CS% -o %SWIG_SRC%\lua_native_wrap.c %SWIG_ROOT%\interfaces\lua_native.i

goto :END

:NOSWIG
echo Please pass swig binary file.
echo build.bat YOUR_PATH\swig.exe

:END
