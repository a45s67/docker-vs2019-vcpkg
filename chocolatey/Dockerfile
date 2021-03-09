# escape=`

# FROM vs2019
ARG FROM_IMAGE=mcr.microsoft.com/windows/servercore:ltsc2019
FROM ${FROM_IMAGE}


SHELL ["powershell","-NoLogo", "-ExecutionPolicy", "Bypass"]



RUN Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); `
choco install -y -f git 

