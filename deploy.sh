#!/bin/bash

# build images
docker build -t jvillete/multi-client:latest -t jvillete/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jvillete/multi-server:latest -t jvillete/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jvillete/multi-worker:latest -t jvillete/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# push the images do docker hub
docker push jvillete/multi-client:latest && docker push jvillete/multi-client:$SHA
docker push jvillete/multi-server:latest && docker push jvillete/multi-server:$SHA
docker push jvillete/multi-worker:latest && docker push jvillete/multi-worker:$SHA

# deploy all kubernetes configs available on "k8s" directory
kubectl apply -f ./k8s
kubectl set image deployments/server-deployment server=jvillete/multi-server:$SHA
kubectl set image deployments/client-deployment client=jvillete/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jvillete/multi-worker:$SHA