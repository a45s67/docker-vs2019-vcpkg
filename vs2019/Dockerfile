# escape=`
# reference : https://github.com/microsoft/vs-dockerfiles/blob/main/native-desktop/Dockerfile

FROM vcpkg_dir

SHELL ["cmd", "/S", "/C"]

# Please download vs_BuildTools.exe from the microsoft page first! Then put it in the working dir.
ADD vs_BuildTools.exe C:\TEMP\vs_buildtools.exe

RUN start /wait C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --add  Microsoft.VisualStudio.Workload.VCTools --includeRecommended`
    --installPath C:\buildtools
# RUN start /wait C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
#     --add Microsoft.VisualStudio.Workload.MSBuildTools `
#     --add Microsoft.VisualStudio.Component.Windows10SDK`
#     --add MicrosoftMicrosoft.VisualStudio.Component.VC.Tools.x86.x64`
#     --add MicrosoftMicrosoft.VisualStudio.Component.VC.ATLMFC`
#     --add Microsoft.VisualStudio.Component.VC.ATL`
#     --installPath C:\buildtools

ENTRYPOINT ["powershell.exe"] 
CMD [ "-NoLogo", "-ExecutionPolicy", "Bypass"]

