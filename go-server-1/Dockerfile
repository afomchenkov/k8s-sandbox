# Stage 1: Build
FROM golang:latest AS builder
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .
RUN go build -o go-server .

# Stage 2: Run
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/go-server .

EXPOSE 8181

CMD ["./go-server"]