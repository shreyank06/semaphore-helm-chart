commands to run
```
microk8s helm install semaphore ./semaphore --namespace semaphore
export NODE_PORT=$(microk8s kubectl get --namespace semaphore -o jsonpath="{.spec.ports[0].nodePort}" services semaphore)
export NODE_IP=$(microk8s kubectl get nodes --namespace semaphore -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
```
You will get the application url after running the above commands and run it to use the app.
