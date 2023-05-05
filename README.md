commands to run
```
cd ansible-semaphore-helm
helm package .
microk8s helm install my-ansible-semaphore ./ans-semaphore-0.1.0.tgz
export POD_NAME=$(microk8s kubectl get pods --namespace default -l "app.kubernetes.io/name=ans-semaphore,app.kubernetes.io/instance=my-ansible-semaphore" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(microk8s kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
microk8s kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
```
Error after Visiting http://127.0.0.1:8080 
```
Forwarding from 127.0.0.1:8080 -> 80
Forwarding from [::1]:8080 -> 80
Handling connection for 8080
E0505 13:46:51.711817  274239 portforward.go:407] an error occurred forwarding 8080 -> 80: error forwarding port 80 to pod c9129f568317f3c53852c4773f3dd593b20c87b9c39989eb557c0c10dbc97617, uid : failed to execute portforward in network namespace "/var/run/netns/cni-fe18249d-1eff-4c8a-70c2-6523e56daca5": failed to connect to localhost:80 inside namespace "c9129f568317f3c53852c4773f3dd593b20c87b9c39989eb557c0c10dbc97617", IPv4: dial tcp4 127.0.0.1:80: connect: connection refused IPv6 dial tcp6: address localhost: no suitable address found 
E0505 13:46:51.712781  274239 portforward.go:233] lost connection to pod
```