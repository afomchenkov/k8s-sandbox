# Simple GO Server

## Run server
```bash
go run main.go
```

## Run test
```bash
go test
```

## API
```text
GET /posts: Retrieve all posts.
GET /posts/{id}: Retrieve a single post by its ID.
POST /posts: Create a new post. The request body should contain the body field.
DELETE /posts/{id}: Delete a post by its ID.
```

## Run build
```bash
chmod +x build.sh
./build.sh
```

## Start in Minikube
```bash
# Build the app image
docker build -t go-server .
# Check image
docker images
# Copy local image into minikube image
minikube image load go-server
# Check the image
minikube image ls
# Create deployment
kubectl create deployment go-server --image=go-server --dry-run=client -o yaml > go-server.deployment.yaml
# Add imagePullPolicy: Never - to tell K8S to use local image only, not pulling from docker hub
# containers:
#    - image: go-server
#       name: go-server
#       imagePullPolicy: Never
#       resources: {}
# Create the deployment
kubectl apply -f k8s/go-server.deployment.yaml
# Verify deployments
kubectl get deployments
# The deployment create one pod automatically, check the pods
# A pod means a single container or a simple virtual machine which runs the application. 
kubectl get pods
# Expose app over port 8181 (internal service port), create service
kubectl expose deployment/go-server --type="NodePort" --port 8181
# Check services
kubectl get services
# Check minikube IP
minikube ip
# Check service URL
minikube service go-server --url
# Test app output
curl http://192.168.49.2:32313
```