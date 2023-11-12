# Build Stage

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./prakalp-p1/prakalp-p1.csproj" --disable-parallel
RUN dotnet publish "./prakalp-p1/prakalp-p1.csproj" -c release -o /app --no-restore

# Serve Stage
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app ./

EXPOSE 5000

ENTRYPOINT [ "dotnet","prakalp-p1.dll" ]