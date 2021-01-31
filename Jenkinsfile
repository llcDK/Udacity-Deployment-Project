pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    make setup
                    make install
                '''
            }
        }

        stage('Lint') {
            steps {
                sh '''
                    make lint
                '''
            }
        }

        stage('Security Scan') {
            steps {
                aquaMicroscanner(imageName: 'alpine:latest', notCompleted: 'exit 1', onDisallowed: 'fail')
            }
        }

    }
}