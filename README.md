
# Udacity-Deployment-Project

## Project Overview

This project is a complete pipeline for deploying a Machine Learning Micro-Service. With a pre-trained `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, this project automatically setups, containerizes, and then deploys the application to Kubernetes. To achieve this goal, this project completes the following tasks:

### Project Tasks

* Test the project code using linting
* Complete a Dockerfile to containerize the application
* Deploy the containerized application using Docker
* Use log statements in the source code to report logs for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy the container using Kubernetes
* Integrate the project with CircleCI

### Project Scope

* Pipeline: The pipeline sets up the environment, installs dependencies, lints all source files, and finally deploys the application in Kubernetes.
* Use Jenkins for CI/CD pipeline: setup environment, lint source code, build the docker container and upload to the image registry, and finally deploy to Kubernetes.
* Use AWS ECR for image registry.
* Use AWS Kubernetes as a Service to deploy the application.

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl


## File Descriptions

* Application main source code: `app.py`
* Shell scripts for exeuting the applications: `*.sh`
* Machine Learning Model in folder: `model_data`

## Jenkins Server Requirement

* Need to install 'git'.
* Need to install 'make' command.
* Need to install python3, pip3, python3-venv.
* Need to install Docker, login with your own credentials, and modify the upload_docker.sh file coorespondingly.
* Jenkins server needs to have sudo permission (configure in `/etc/sudoers`).
* Update AWS CLI to the latest version, login, and authenticate to Docker using `aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws`
