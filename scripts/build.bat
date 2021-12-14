@ECHO OFF

CD ..\cmd\readoelf

REM Windows
SET GOOS=windows
IF NOT EXIST "%OO_PS4_TOOLCHAIN%\bin\windows" MKDIR %OO_PS4_TOOLCHAIN%\bin\windows
go.exe build -o readoelf.exe
COPY /Y readoelf.exe %OO_PS4_TOOLCHAIN%\bin\windows\readoelf.exe
DEL readoelf.exe

REM Linux
SET GOOS=linux
IF NOT EXIST "%OO_PS4_TOOLCHAIN%\bin\linux" MKDIR %OO_PS4_TOOLCHAIN%\bin\linux
go.exe build -o readoelf
COPY /Y readoelf %OO_PS4_TOOLCHAIN%\bin\linux\readoelf
DEL readoelf

REM MacOS
SET GOOS=darwin
IF NOT EXIST "%OO_PS4_TOOLCHAIN%\bin\macos" MKDIR %OO_PS4_TOOLCHAIN%\bin\macos
go.exe build -o readoelfosx
COPY /Y readoelfosx %OO_PS4_TOOLCHAIN%\bin\macos\readoelf
DEL readoelfosx