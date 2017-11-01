#!/bin/bash

# Install minikube, kubectl, helm

minikube start

eval $(minikube docker-env)

QUIZZER_REPO=https://github.com/nmuzychuk/quizzer.git
docker build -t quizzer:stable ${QUIZZER_REPO}

helm init && sleep 15
helm dependency update
helm install .
