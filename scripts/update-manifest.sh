#!/bin/bash

IMAGE=$1

sed "s|IMAGE_PLACEHOLDER|$IMAGE|g" k8s/deployment.yaml > k8s/deploy.yaml
