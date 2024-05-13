# ASP.Net with RDLC's using a custom font in a Windows Container
A client had a website hosted on a VM and the cost of it was high. They were on a VM, because they needed to add a custom font they use in their RDLC's. Using a webapp, there wasn't an easy way to do that. So we created a windows container, where we build our code and push over the ttf file to the windows/fonts directory and then set our entry point to run a powershell script. In the powershell script, we add a registry item for our custom font and then the container starts up. See the docker file at the root directory. 

There is a endpoint in the home controller for creating a simple PDF that renders text using the font. There is a parameter called useFont. Set it to true/false to see the difference
