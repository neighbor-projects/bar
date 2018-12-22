FROM golang:1.11.3-alpine3.8 AS build

COPY . /

WORKDIR /

RUN CGO_ENABLED=0 go build -o /bin/bar main.go

FROM alpine:3.8

RUN apk --no-cache add ca-certificates

COPY --from=build /bin/bar .

CMD ["./bar"]

