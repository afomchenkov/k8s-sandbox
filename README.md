## K8S Sandbox

## Install & Run Minikube in mac OS | K8s Cluster

1. Check if virtualization is supported on macOS:
   `sysctl -a | grep -E --color 'machdep.cpu.features|VMX'`

2. Install kubectl
    `brew install kubectl`

3. Check kubectl version
    `kubectl version`

4. Install a Hypervisor
    `brew install hyperkit`

5. Install Minikube
    `brew install minikube`

> Minikube commands
- Start Minikube
    `minikube start`
- Start Minikube with hypervisor
    `minikube start --vm-driver=hyperkit`
- Check status
    `minikube status`
- Stop Minikube
    `minikube stop`
- Delete Minikube
    `minikube delete`


> Kubectl commands
- Check status
    `kubectl get componentstatuses`
- List all nodes in cluster
    `kubectl get nodes`
- Get more info on specific node
    `kubectl describe nodes kube1`
- Create a context with a different default namespace
    `kubectl config set-context my-context --namespace=my-space`
- Use new context
    `kubectl config use-context my-context`
- Extract and print the IP of the specific pod
    `kubectl get pods my-pod -o jsonpath --template={.status.podIP}`
- View multiple objects of different types (display all pods and services for a given namespace)
    `kubectl get pods,services`
- View more detailed information about particular object
    `kubectl describe <resource-name> <obj-name>`
- View a list of supported fields for each supported type of Kubernetes object
    `kubectl explain pods`
- Create (update) object from file
    `kubectl apply -f obj.yaml`
- Delete object
    `kubectl delete -f obj.yaml`
- Delete object by resource type and name
    `kubectl delete <resource-name> <obj-name>`
- Add label(annotation) color=red to a pod 'bar'
    `kubectl label pods bar color=red --overwrite`
- Remove label
    `kubectl label pods bar color-`
- View logs for a running container
    `kubectl logs <pod-name>`
- Execute command in running container
    `kubectl exec -it <pod-name> -- bash`
- Attach to the running process
    `kubectl attach -it <pod-name>`
- Copy file to/from a container
    `kubectl cp <pod-name>:</path/to/remote/file> </path/to/local/file>`
- Open up a connection that forwards traffic from the local machine 8080 to remote container 80
    `kubectl port-forward <pod-name> 8080:80`
- View Kubernetes events
    `kubectl get events`
    `kubectl get events --watch`
- View top list of resources in use
    `kubectl top pods`
    `kubectl top pods --all-namespaces`
- Load the image to Minikube image list
    `minikube image load {my-name}`
    `minikube image ls`
- Create deployment
    `kubectl create deployment {my-name} --image={my-image-name} --dry-run=client -o yaml > {my-name}.yaml`
    `kubectl apply -f {my-name}.yaml`
    `kubectl get deployments`
    `kubectl expose deployment/{my-name} --type="NodePort" --port 80`
    `kubectl get services`
- Remove service
    `kubectl delete service {my-name}`
- Remove pod
    `kubectl delete pods -l app={my-name}`
- Get Minikube IP
    `minikube ip`
- Get service URL
    `minikube service {my-name} --url`
<!-- The app should be accessible over: http://<minikube_ip>:<external_port> -->
