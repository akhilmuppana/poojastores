# Use the .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project file and restore the dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the files and build the app
COPY . ./
RUN dotnet publish -c Release -o out

# Use the .NET Runtime image as the final image
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS runtime

# Set the working directory
WORKDIR /app

# Copy the output from the build stage
COPY --from=build /app/out ./

# Set the entrypoint to run the app
ENTRYPOINT ["dotnet", "PoojaStores.dll"]
