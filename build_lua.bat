@echo off
set PROJ_ROOT=%~dp0
set SWIG_SRC=%PROJ_ROOT%\swig\src
set LUA_ROOT=%PROJ_ROOT%\lua534
set LUA_SRC=%LUA_ROOT%\src
set LUA_BUILD_DIR=%LUA_ROOT%\build

:: create a clean "binary" installation
rd /Q /S %LUA_BUILD_DIR%
md %LUA_BUILD_DIR%
md %LUA_BUILD_DIR%\bin
md %LUA_BUILD_DIR%\lib
md %LUA_BUILD_DIR%\include
md %LUA_BUILD_DIR%\tmp

:: building
cd %LUA_BUILD_DIR%\tmp
cl /MD /O2 /c /DLUA_BUILD_AS_DLL %LUA_SRC%\*.c %SWIG_SRC%\*.c
ren lua.obj lua.o
ren luac.obj luac.o
link /DLL /IMPLIB:lua5.3.4.lib /OUT:lua5.3.4.dll *.obj
link /OUT:lua.exe lua.o lua5.3.4.lib
lib /OUT:lua5.3.4-static.lib *.obj
link /OUT:luac.exe luac.o lua5.3.4-static.lib
cd /d %PROJ_ROOT%

:: placing *.dll and head file
copy %LUA_BUILD_DIR%\tmp\*.exe %LUA_BUILD_DIR%\bin\*.*
copy %LUA_BUILD_DIR%\tmp\*.dll %LUA_BUILD_DIR%\lib\*.*
copy %LUA_SRC%\luaconf.h %LUA_BUILD_DIR%\include\*.*
copy %LUA_SRC%\lua.h %LUA_BUILD_DIR%\include\*.*
copy %LUA_SRC%\lualib.h %LUA_BUILD_DIR%\include\*.*
copy %LUA_SRC%\lauxlib.h %LUA_BUILD_DIR%\include\*.*
copy %LUA_SRC%\lua.hpp %LUA_BUILD_DIR%\include\*.*

%LUA_BUILD_DIR%\bin\lua.exe -e"print [[Hello!]];print[[Simple Lua test successful!!!]]"
echo.