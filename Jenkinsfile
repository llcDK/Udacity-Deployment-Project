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
                    # Install hadolint
	                wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	                chmod +x hadolint
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
                    echo 'Deploy to AWS Kubernetes as Service!'
                '''
            }
        }
    }
}