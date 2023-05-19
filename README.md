commands to run
```
microk8s helm install semaphore ./semaphore --namespace semaphore
```
check the pods
```
microk8s kubectl get pods -n semaphore 
```
if both sql and semaphore pods are running, visit
```
https://o5gc-semaphore/
```
