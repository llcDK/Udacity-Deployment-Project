pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "#!/bin/bash \n" + 
                   "make setup \n" +
                   "make install \n"
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