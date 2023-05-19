commands to run
```
microk8s helm install sql ./sql --namespace semaphore
```
```
microk8s helm install semaphore ./semaphore --namespace semaphore
```
check the pods
```
microk8s kubectl get pods -n semaphore 
```
<<<<<<< HEAD
if both sql and semaphore pods are running, get the url
```
export NODE_IP=$(microk8s kubectl get nodes --namespace semaphore -o jsonpath="{.items[0].status.addresses[0].address}")
echo https://$NODE_IP
```
Liveliness and readiness probes will show success after sometime after describing the pods
```
microk8s kubectl describe pods semaphore -n semaphore
```
```
microk8s kubectl describe pods sql -n semaphore
```
