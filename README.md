commands to run
```
cd ansible-semaphore-helm
helm package .
microk8s helm install my-ansible-semaphore ./ans-semaphore-0.1.0.tgz
export NODE_PORT=$(microk8s kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-ansible-semaphore-ans-semaphore)
export NODE_IP=$(microk8s kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
```
You will get the application url after running the above commands and run it to use the app.
