pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                sh '''#!/bin/bash
                    python3 -m venv ~/.devops
	                source ~/.devops/bin/activate
                    make install 
                '''
            }
        }

        stage('Lint') {
            steps {
                sh '''#!/bin/bash
                    source ~/.devops/bin/activate
                    make lint
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''#!/bin/bash
                    source ~/.devops/bin/activate
                    sudo docker build --tag=flasksklearn .
                    sudo ./upload_docker.sh
                    echo 'Successfully build the Docker Container!'
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''#!/bin/bash
                    kubectl get pods
                    kubectl set image deployment udacity-project-server back-end=public.ecr.aws/m3h6r7n8/udacity:latest --record=true
                    kubectl get pods
                    echo 'Deploy to AWS Kubernetes as Service!'
                '''
            }
        }
    }
}