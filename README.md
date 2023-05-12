commands to run
```
cd ansible-semaphore-helm
helm package .
microk8s helm install my-ansible-semaphore ./ans-semaphore-0.1.0.tgz
export POD_NAME=$(microk8s kubectl get pods --namespace default -l "app.kubernetes.io/name=ans-semaphore,app.kubernetes.io/instance=my-ansible-semaphore" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(microk8s kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
microk8s kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
```
then visit http://127.0.0.1:8080 
