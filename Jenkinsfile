pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    chmod +x build.sh
                    ./build.sh
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