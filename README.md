commands to run
```
microk8s kubectl delete pvc data-mariadb-0 -n semaphore
```
```
microk8s helm install semaphore ./semaphore -n semaphore
```
Get the url by running these commands
```
  export NODE_IP=$(microk8s kubectl get nodes --namespace semaphore -o jsonpath="{.items[0].status.addresses[0].address}")
  echo https://$NODE_IP
```

if no mariadb tgz
```
```
microk8s helm install mariadb oci://registry-1.docker.io/bitnamicharts/mariadb \
  --namespace semaphore \
  --set auth.rootPassword=semaphore \
  --set auth.database=semaphore \
  --set auth.username=semaphore \
  --set auth.password=semaphore
```

