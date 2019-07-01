# flink-k8s-tutorial
How to deploy a flink culster on k8s.

## contents
* Flink session cluster on Kubernetes

## Flink session cluster on Kubernetes
>A Flink session cluster is executed as a long-running Kubernetes Deployment. Note that you can run multiple Flink jobs on a session cluster. Each job needs to be submitted to the cluster after the cluster has been deployed.

>A basic Flink session cluster deployment in Kubernetes has three components:

> 1. a Deployment/Job which runs the JobManager
> 2. a Deployment for a pool of TaskManagers
> 3. a Service exposing the JobManager’s REST and UI ports

#### Deploy Flink session cluster on Kubernetes

##### Prerequisites
> 1. you need to replace your own domain name in ingress-nginx.yaml.


##### Run and Deploy
```bash
bash run.sh
```



