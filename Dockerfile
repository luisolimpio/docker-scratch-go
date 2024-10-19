FROM golang:1.23-alpine3.20 AS builder

WORKDIR /usr/src/app

COPY main.go .

RUN go mod init main && \
    go build -ldflags "-s -w"

FROM scratch

WORKDIR /usr/app/bin

COPY --from=builder /usr/src/app/main .

CMD ["/usr/app/bin/main"]