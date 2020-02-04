FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env

LABEL maintainer="damian@szkoladockera.pl"

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /app/out .

ENV ASPNETCORE_ENVIRONMENT=Production

ENTRYPOINT ["dotnet", "LinuxAspNetCore.dll"]