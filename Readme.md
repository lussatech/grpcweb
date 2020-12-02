#GRPC-web

> cloud native build of grpc-web proxy

## build

```bash
docker buildx build --platform linux/amd64,linux/arm64 . -t grpcweb --push
```

## run
```bash
docker run grpcweb
```
