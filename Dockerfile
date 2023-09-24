FROM mcr.microsoft.com/dotnet/sdk:3.1 as build
WORKDIR /poojastores
COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /poojastores
COPY --from=build /app/out .
EXPOSE 80
ENTRYPOINT ["dotnet" , "PoojaStores.dll" ]
