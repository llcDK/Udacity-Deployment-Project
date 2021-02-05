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
                withKubeConfig(
                    [credentialsId: 'kubeConfig', serverUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com']
                ){
                    sh '''
                        echo $KUBECONFIG
                        kubectl get pods -o wide
                    '''
                }
            }
        }

        stage('Deploy blue container') {
            when { branch 'blue'}
            steps {
                sh '''
                    echo 'Deploy Blue Container'
                '''
            }
        }

        stage('Redirect service to blue container') {
            when { branch 'blue'}
            steps {
                sh '''
                    echo 'Redirect service to blue container'
                '''
            }
        }

        stage('Deploy green container') {
            when { branch 'green'}
            steps {
                sh '''
                    echo 'Deploy Green Container'
                '''
            }
        }

        stage('Redirect service to green container') {
            when { branch 'green'}
            steps {
                sh '''
                    echo 'Redirect service to green container'
                '''
            }
        }
    }
}