# Node K8S Test App

- Build image:
   `docker build -t node-server-1 .`
- Run:
   `docker run --rm -p 5050:5050 node-server-1`

## Start in Minikube

```bash
# Build the app image
docker build -t node-server-1 .
# Check image
docker images
# Copy local image into minikube image
minikube image load node-server-1
# Check the image
minikube image ls
# Create deployment
kubectl create deployment node-server-1 --image=node-server-1 --dry-run=client -o yaml > node-server-1.deployment.yaml
# Add imagePullPolicy: Never - to tell K8S to use local image only, not pulling from docker hub
# containers:
#    - image: node-server-1
#       name: node-server-1
#       imagePullPolicy: Never
#       resources: {}
# Create the deployment
kubectl apply -f node-server-1.deployment.yaml
# Verify deployments
kubectl get deployments
# The deployment create one pod automatically, check the pods
# A pod means a single container or a simple virtual machine which runs the application. 
kubectl get pods
# Expose app over port 8080 (internal service port), create service
kubectl expose deployment/node-server-1 --type="NodePort" --port 8080
# Check services
kubectl get services
# Check minikube IP
minikube ip
# Check service URL
minikube service node-server-1 --url
# Test app output
curl http://192.168.49.2:32313
```