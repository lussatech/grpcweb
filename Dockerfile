FROM golang:1.14 AS builder
ARG TARGETPLATFORM
WORKDIR /build
COPY . ./
RUN GOOS=$(echo $TARGETPLATFORM | cut -f1 -d/)
RUN GOARCH=$(echo $TARGETPLATFORM | cut -f2 -d/)
RUN CGO_ENABLED=0 go get -u github.com/improbable-eng/grpc-web/go/grpcwebproxy

FROM alpine:3.9
RUN apk --no-cache add ca-certificates
WORKDIR /
COPY --from=builder /go/bin/grpcwebproxy .
ENTRYPOINT ["/grpcwebproxy"]
CMD []
