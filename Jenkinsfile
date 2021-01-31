pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''#!/bin/bash
                    python3 -m venv ~/.devops
	                source ~/.devops/bin/activate
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

        stage('Deploy') {
            steps {
                sh '''#!/bin/bash
                    echo 'Deploy to AWS Kubernetes as Service!'
                '''
            }
        }

    }
}