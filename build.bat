@echo off

call build_swig.bat %1
call build_lua.bat
call build_test.bat  