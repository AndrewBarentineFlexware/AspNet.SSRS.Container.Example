# ASP.Net with RDLC's using a custom font in a Windows Container
A client had a website hosted on a VM and the cost of it was high. They were on a VM, because they needed to add a custom font they use in their RDLC's. Using a webapp, there wasn't an easy way to do that. So we created a windows container, where we build our code and push over the ttf file to the windows/fonts directory and then set our entry point to run a powershell script. In the powershell script, we add a registry item for our custom font and then the container starts up. See the docker file at the root directory. 

There is a endpoint in the home controller for creating a simple PDF that renders text using the font. There is a parameter called useFont. Set it to true/false to see the difference

## Azure Setup

1. Create an Azure Container registry
2. Open cmd on your computer and navigate to the root directory of the project
3. Perform an az login
4. Perform an az acr login --name {Name of the acr from step one goes here}
5. Build your Image: docker build -t {acr name goes here}.azurecr.io/{Name your image}:latest .
6. Push it to your ACR: docker push {acr name goes here}.azurecr.io/{Name your image}:latest
7. Create an Azure web app that is windows based for containers
8. Update your web app to pull the latest image you published to your ACR
