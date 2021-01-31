pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''#!/bin/bash
                    pip3 install --upgrade pip &&\
                        pip3 install -r requirements.txt
                    # Install hadolint
                    sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
                    sudo chmod +x /bin/hadolint
                    # Install pylint
                    pip3 install pylint
                '''
            }
        }

        stage('Lint') {
            steps {
                sh '''#!/bin/bash
                    make lint
                '''
            }
        }

        stage('Security Scan') {
            steps {
                aquaMicroscanner(imageName: 'alpine:latest', notCompleted: 'exit 1', onDisallowed: 'fail')
            }
        }

        stage('Deploy') {
            steps {
                sh '''#!/bin/bash
                    echo 'Deploy to AWS Kubernetes as Service'
                '''
            }
        }

    }
}