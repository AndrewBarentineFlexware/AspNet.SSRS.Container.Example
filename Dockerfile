# Use the official ASP.NET 4.8 base image
FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the solution file into the container
COPY AspNet.SSRS.Container.Example.sln .
COPY AspNet.SSRS.Container.Example/AspNet.SSRS.Container.Example.csproj ./AspNet.SSRS.Container.Example/
COPY AspNet.SSRS.Container.Example/packages.config ./AspNet.SSRS.Container.Example/

# Run NuGet restore to restore packages
RUN nuget.exe locals all -clear
RUN nuget restore

# Copy the project files and directories into the container
COPY AspNet.SSRS.Container.Example/. ./AspNet.SSRS.Container.Example/
WORKDIR /app/AspNet.SSRS.Container.Example

# Build the project
RUN msbuild /p:Configuration=Release -r:False

# Use a lighter base image for the runtime
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set the working directory for the published application
WORKDIR /inetpub/wwwroot

# Copy the published output from the build stage to the runtime image
COPY --from=build /app/AspNet.SSRS.Container.Example/. .

# Copy required fonts
WORKDIR /windows/fonts
COPY --from=build /app/AspNet.SSRS.Container.Example/HelmetCondensed.ttf .
COPY --from=build /app/AspNet.SSRS.Container.Example/arial.ttf .

WORKDIR /app
COPY --from=build /app/AspNet.SSRS.Container.Example/startup.ps1 .

# Expose port 80 to the outside world
EXPOSE 80

# Start the IIS service and your application when the container starts
ENTRYPOINT ["powershell", "-File", "C:\\app\\startup.ps1"]
