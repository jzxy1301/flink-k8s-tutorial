#!/usr/bin/env bash

kubectl create -f job-cluster-service.yaml
kubectl create -f job-cluster-deployment.yaml
kubectl create -f taskmanager-deployment.yaml
kubectl create -f ingress-nginx.yaml
