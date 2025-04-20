#!/bin/bash

# Exit script on first error
set -e

# Build Go binary
echo "Building Go binary..."
go build -o go-server

# # Login to Docker Hub
# echo "Logging into Docker Hub..."
# docker login -u sumit -p your_password

# Build Docker image - should be run on Linux
echo "Building Docker image..."
docker build -t go-server .

# # Push image to Docker Hub
# echo "Pushing Docker image to Docker Hub..."
# docker push go-server

# Removing binary file from local
echo "Cleaning up..."
rm go-server

echo "Build finished."