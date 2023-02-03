REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%


@REM SET PATH=^
@REM %DOWNLOADS_DIR%\PortableGit\bin;^
@REM %DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;

set PATH=^
D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

cmake -G "Visual Studio 16 2019" -A x64 ^
-DCrossWindow_ROOT="D:/Code Projects/cpp-libraries/crosswindow-c3511e43d0bbdc5fd23b4717580cc47ad3df87e4c-msvc2019" ^
-DCMAKE_INSTALL_PREFIX="%~dp0cmake-build/123" ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . --target ALL_BUILD --config Release -- /nologo /verbosity:minimal /maxcpucount
pause