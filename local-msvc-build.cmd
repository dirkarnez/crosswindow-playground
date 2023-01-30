REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%


@REM %DOWNLOAD_DIR%\mingw64-win32; ^
@REM %DOWNLOAD_DIR%\mingw64-win32\bin; ^

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;

cmake -G "Visual Studio 16 2019" -A x64 ^
-DCrossWindow_ROOT="C:/Users/19081126D/Downloads/crosswindow-c3511e43d0bbdc5fd23b4717580cc47ad3df87e4c-msvc2019" ^
-DBUILD_SHARED_LIBS=OFF ^
-DCMAKE_INSTALL_PREFIX="%~dp0build/123" ^
-B./cmake-build &&^
cd cmake-build &&^
cmake --build . --target ALL_BUILD --config Release -- /nologo /verbosity:minimal /maxcpucount
pause