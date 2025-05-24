# This Dockerfile is used to build a Docker image for an ASP.NET Core application.
# It uses the official ASP.NET Core runtime image as the base image and sets up the working directory,
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build 
#workdir: This command sets the working directory for the following instructions in the Dockerfile.
# It specifies the directory where the commands will be executed.
WORKDIR /source
# Copy any csproj  file and restore as distinct layers
COPY *.csproj . 
#run: This command is used to execute a command in the Docker image during the build process.
#run dotnet restore: This command restores the dependencies and tools of the project specified in the .csproj file.
# This is typically done to ensure that all required packages are available before building the application.
RUN dotnet restore
# Copy the rest of the application code
#copy . .: This command copies the entire contents of the current directory on the host system to the /source directory in the Docker image.
# It includes all files and subdirectories, allowing the application code to be included in the Docker image.
# It is used to ensure that the application code is available for building and running the application.
COPY . . 
# run dotnet publish: This command compiles the application and publishes it to the specified output directory.
# It prepares the application for deployment by generating the necessary files and dependencies.    
RUN dotnet publish -c Release -o /app
#from mcr.microsoft.com/dotnet/aspnet:5.0: This command specifies the base image for the final stage of the Dockerfile.
# It uses the official ASP.NET Core runtime image version 5.0 as the base image for running the application.
FROM mcr.microsoft.com/dotnet/aspnet:5.0
#workdir: This command sets the working directory for the following instructions in the Dockerfile. It specifies the directory where the application will be executed.
WORKDIR /app
#copy --from=build /app .: This command copies the published application files from the build stage to the current working directory (/app) in the final image.
# This allows the final image to contain the built application ready for execution.

COPY  --from=build /app .
#entrypoint: This command specifies the command to run when the container starts. In this case, it runs the application using the dotnet command and the name of the published application file (hrapp.dll).
# This ensures that the application is executed when the container is started.
# It is the entry point for the application.
# It copies the published application files from the build stage to the final image and sets the entry point for the application.
ENTRYPOINT ["dotnet", "hrapp.dll"]