FROM golang:latest AS build
COPY . /src/
WORKDIR /src/
RUN CGO_ENABLED=0 go build -o sauron

#FROM alpine:latest
FROM scratch
WORKDIR /app
COPY --from=build /src/sauron /app/
EXPOSE 3000
ENTRYPOINT ["./sauron"]