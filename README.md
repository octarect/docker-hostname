# docker-hostname

This is a simple docker image which just shows `$HOSTNAME`. It is built from [library/nginx](https://hub.docker.com/_/nginx).

Official nginx images are automatically patched and pushed into GitHub Container Registry.
See https://github.com/octarect/docker-hostname/pkgs/container/hostname

## Usage

Available tags are listed in https://github.com/octarect/docker-hostname/pkgs/container/hostname/versions

### Docker

```bash
docker run -d --name hostname -p 8080:80 ghcr.io/octarect/hostname:latest
```

Test:

```
$ curl localhost:8080
29d607790136
```

### Kubernetes

```bash
kubectl create deployment hostname --image=ghcr.io/octarect/hostname:1.21.6-alpine --replicas=3
```

Then you can test it by the following;

```
$ kubectl get pod
NAME                        READY   STATUS    RESTARTS   AGE
hostname-59b54b98fd-62rbw   1/1     Running   0          11s
hostname-59b54b98fd-8z6cb   1/1     Running   0          12s
hostname-59b54b98fd-kv5v4   1/1     Running   0          12s

$ kubectl expose deployment hostname --port=80
service/hostname exposed

$ kubectl run tester --image=nginx
pod/tester created

$ kubectl exec tester -- curl -s hostname.default.svc.cluster.local
hostname-59b54b98fd-kv5v4
$ kubectl exec tester -- curl -s hostname.default.svc.cluster.local
hostname-59b54b98fd-8z6cb
$ kubectl exec tester -- curl -s hostname.default.svc.cluster.local
hostname-59b54b98fd-62rbw
```
