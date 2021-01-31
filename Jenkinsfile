pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh '''#!/bin/bash
                    hadolint Dockerfile
                    pylint --disable=R,C,W1203,W1309 app.py
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