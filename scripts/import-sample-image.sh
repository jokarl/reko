#!/usr/bin/env bash
az acr login --name crrekodev
docker pull mcr.microsoft.com/k8se/quickstart:latest 
docker tag mcr.microsoft.com/k8se/quickstart crrekodev.azurecr.io/samples/quickstart
docker push crrekodev.azurecr.io/samples/quickstart