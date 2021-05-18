FROM mcr.microsoft.com/dotnet/sdk:5.0.203-alpine3.13-amd64 as build
WORKDIR /src/App
COPY App .
RUN dotnet publish \ 
    --configuration Release \ 
    --runtime linux-musl-x64 \ 
    --self-contained false \
    --output /build \
    -p:PublishSingleFile=true
RUN rm /build/*.pdb

FROM mcr.microsoft.com/dotnet/aspnet:5.0.6-alpine3.13-amd64
COPY --from=build /build /app
WORKDIR /app
ENTRYPOINT ["./NetCore.Docker"]