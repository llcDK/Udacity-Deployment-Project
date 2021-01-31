pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    make install
                '''
            }
        }

        stage('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }

        stage('Security Scan') {
            steps {
                aquaMicroscanner(imageName: 'alpine:latest', notCompleted: 'exit 1', onDisallowed: 'fail')
            }
        }

    }
}