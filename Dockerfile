from microsoft/dotnet:sdk as build-env
workdir /app

copy *.csproj ./
run dotnet restore

copy . ./
run dotnet publish -c Release -o out

From microsoft/dotnet:aspnetcore-runtime
workdir /app
copy --from=build-env /app/out .
entrypoint ["dotnet", "devops3.dll"]