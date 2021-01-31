pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    yum install python3-pip
                    make setup
                    make install
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