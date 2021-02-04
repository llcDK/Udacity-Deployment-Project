#!/usr/bin/env bash
# This file tags and uploads an image to AWS ECR

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
# dockerpath="llcdk/flasksklearn"
dockerpath="public.ecr.aws/m3h6r7n8/udacity"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
    docker image tag flasksklearn $dockerpath

# Step 3:
# Push image to a docker repository
docker image push $dockerpath