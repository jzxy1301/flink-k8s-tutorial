#!/usr/bin/env bash

kubectl create -f jobmanager-service.yaml
kubectl create -f jobmanager-deployment.yaml
kubectl create -f taskmanager-deployment.yaml
kubectl create -f ingress-nginx.yaml
