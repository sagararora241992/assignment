# Mediawiki Installation Guide

## Pre-requisite

1. Kubernetes Cluster with tiller enabled 
2. Local linux machine with helm and kubectl cli config
ured
3. Private/Public docker registry 
4. Run below command to check connectivity with your cluster.

```bash
kubectl cluster-info
```

## Docker build and push steps

```sh 
docker build -t <tag for mediawiki docker image> .
docker push <tag for mediawiki docker image>
```

## Helm installation
1. Edit values.yaml and add image tag that you mentioned in above steps.
2. Run below command
```sh
helm install --name mediawiki --namespace mediawiki-assignment .

```
3. Check pod status by running 
```sh
kubectl get pods -n mediawiki-assignment

```
## Troubleshooting guide
1. If pulling from private registry which need your credentials run below command
```sh
kubectl create ns mediawiki-assignment
kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword>  -n mediawiki-assignment
helm install --name mediawiki --namespace mediawiki-assignment .
```
Note: Before running helm install make sure you are giving secret name in imagepullsecret section in values.yaml
