# escape=`
# reference : https://github.com/microsoft/vs-dockerfiles/blob/main/native-desktop/Dockerfile

ARG FROM_IMAGE=mcr.microsoft.com/windows/servercore:ltsc2019
FROM ${FROM_IMAGE}

SHELL ["cmd", "/S", "/C"]


ADD vs_BuildTools.exe C:\TEMP\vs_buildtools.exe
RUN start /wait C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --add Microsoft.VisualStudio.Workload.MSBuildTools `
    --add Microsoft.VisualStudio.Component.Windows10SDK`
    --add MicrosoftMicrosoft.VisualStudio.Component.VC.Tools.x86.x64`
    --add MicrosoftMicrosoft.VisualStudio.Component.VC.ATLMFC`
    --add Microsoft.VisualStudio.Component.VC.ATL`
    --installPath C:\BuildTools

ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

