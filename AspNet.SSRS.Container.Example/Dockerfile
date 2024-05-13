#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/publish} .

WORKDIR /windows/fonts
COPY HelmetCondensed.ttf .

WORKDIR /app
COPY startup.ps1 .

# Start the IIS service and your application when the container starts
#ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
ENTRYPOINT ["powershell.exe", "-f", "C:\app\startup.ps1"]