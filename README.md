# flink-k8s-tutorial
How to deploy a flink culster on k8s.

## contents
* Flink session cluster on Kubernetes
* Flink job cluster on Kubernetes


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


## Flink job cluster on Kubernetes
> A Flink job cluster is a dedicated cluster which runs a single job. The job is part of the image and, thus, there is no extra job submission needed.

> Creating the job-specific image, it needs to contain the user code jars of the job for which the cluster is started. Therefore, one needs to build a dedicated container image for every job. Please follow these instructions to build the Docker image.


##### Prerequisites
> 1. you need to replace your own domain name in ingress-nginx.yaml.
> 2. you need to replace the ${VARIABLES} in the file with concrete values. ${FLINK_IMAGE_NAME} and ${FLINK_JOB_PARALLELISM}
> 3. you need to build the ${FLINK_IMAGE_NAME}

##### build the ${FLINK_IMAGE_NAME} 

If you want to build the Flink image from the version you have checked out locally run:

`build.sh --from-local-dist --job-jar <PATH_TO_JOB_JAR> --image-name <IMAGE_NAME>`

Note that you first need to call mvn package -pl flink-dist -am to build the Flink binaries.

If you want to build the Flink image from an archive stored under <PATH_TO_ARCHIVE> run:

`build.sh --from-archive <PATH_TO_ARCHIVE> --job-jar <PATH_TO_JOB_JAR> --image-name <IMAGE_NAME>`

If you want to build the Flink image for a specific version of Flink/Hadoop/Scala run:

`build.sh --from-release --flink-version 1.6.0 --hadoop-version 2.8 --scala-version 2.11 --image-name <IMAGE_NAM`

Please note that from Flink-1.8, hadoop version is optional and you could build the Flink image without providing any hadoop version.

##### Run and Deploy
```bash
bash run.sh
```