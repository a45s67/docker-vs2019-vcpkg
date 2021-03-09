# escape=`


FROM chocolatey
SHELL [ "powershell" ,"-NoLogo", "-ExecutionPolicy", "Bypass"]
RUN ` 
git clone https://github.com/microsoft/vcpkg.git;`
cd vcpkg;`
git checkout -b stable 2020.11-1;
# Invoke-WebRequest https://github.com/microsoft/vcpkg/archive/2020.11-1.zip -Outfile vcpkg.zip; `
# Expand-Archive -LiteralPath vcpkg.zip -DestinationPath .;


# CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

ENTRYPOINT /BuildTools/Common7/Tools/VsDevCmd.bat &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
