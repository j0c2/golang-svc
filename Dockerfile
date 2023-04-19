# Start from the official Golang base image
FROM golang:1.17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to download dependencies
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code from the current directory to the working directory inside the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose the port that the app runs on
EXPOSE 8080

# Run the binary program produced by the build
CMD ["/app/main"]

