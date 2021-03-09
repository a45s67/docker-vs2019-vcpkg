# escape=`


FROM vs2019

RUN [ "/BuildTools/Common7/Tools/VsDevCmd.bat" ]

SHELL [ "powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
WORKDIR /vcpkg



RUN ` 
# Invoke-WebRequest https://github.com/microsoft/vcpkg/archive/2020.11-1.zip -Outfile vcpkg.zip; `
# Expand-Archive -LiteralPath vcpkg.zip -DestinationPath .;`
.\bootstrap-vcpkg.bat;`
.\vcpkg.exe integrate install ;`
.\vcpkg.exe install libzip:x64-windows-static ;`
.\vcpkg.exe install libzip:x86-windows-static ;`
.\vcpkg.exe install yara:x64-windows-static ;`
.\vcpkg.exe install yara:x86-windows-static ;`
.\vcpkg.exe install spdlog:x64-windows-static ;`
.\vcpkg.exe install spdlog:x86-windows-static ;


ENTRYPOINT /BuildTools/Common7/Tools/VsDevCmd.bat &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]


