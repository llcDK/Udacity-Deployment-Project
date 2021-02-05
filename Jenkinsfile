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
                withEnv(["KUBECONFIG=/home/ec2-user/.kube/dev-config","IMAGE=public.ecr.aws/m3h6r7n8/udacity:latest"]){
                    sh '''
                        kubectl get pods -o wide
                    '''
                }
            }
        }

        stage('Deploy blue container') {
            when { branch 'blue'}
            steps {

            }
        }

        stage('Redirect service to blue container') {
            when { branch 'blue'}
            steps {
                
            }
        }

        stage('Deploy green container') {
            when { branch 'green'}
            steps {
                
            }
        }

        stage('Redirect service to green container') {
            when { branch 'green'}
            steps {
                
            }
        }
    }
}