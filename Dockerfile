FROM golang:1.12-alpine3.10
WORKDIR /go/src/web
COPY . .
RUN CGO_ENABLED=0 go get -v ./...
FROM scratch
COPY --from=0 /go/bin/web /
ENTRYPOINT ["/web"]