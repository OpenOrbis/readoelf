cd ../cmd/readoelf

## Windows
GOOS=windows go build -o readoelf.exe
mv ./readoelf.exe ${OO_PS4_TOOLCHAIN}/bin/windows/readoelf.exe

## Linux
go build -o readoelf
mv ./readoelf ${OO_PS4_TOOLCHAIN}/bin/linux/readoelf

## MacOS
GOOS=darwin GOARCH=amd64 go build -o readoelfosx
mv ./readoelfosx ${OO_PS4_TOOLCHAIN}/bin/macos/readoelf
