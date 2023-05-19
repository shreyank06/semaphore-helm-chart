commands to run
```
microk8s helm install semaphore ./semaphore --namespace semaphore
```
check the pods
```
microk8s kubectl get pods -n semaphore 
```
vist the url echoed
