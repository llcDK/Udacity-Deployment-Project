pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''#!/bin/bash
                    echo 'Complete Build stage!'
                '''
            }
        }

        stage('Lint') {
            steps {
                sh '''#!/bin/bash
                    echo 'Complete Lint!'
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
                    echo 'Deploy to AWS Kubernetes as Service!'
                '''
            }
        }

    }
}