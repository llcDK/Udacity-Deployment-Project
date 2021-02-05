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

        stage('Create the kubeconfig file') {
            steps {
                withAWS(
                    region:'us-west-2', 
                    credentials: 'aws_id',
                    endpointUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com'
                ){
                    sh '''
                        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
                        /usr/local/bin/kubectl version --client
                        aws eks --region us-west-2 update-kubeconfig --name Udacity-Project-Cluster
                        /usr/local/bin/kubectl apply -f cluster/service.yml
                        /usr/local/bin/kubectl get pods -o wide
                    '''
                }
            }
        }

        stage('Deploy blue container') {
            when { branch 'blue'}
            steps {
                withAWS(
                    region:'us-west-2', 
                    credentials: 'aws_id',
                    endpointUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com'
                ){
                    sh '''
                        /usr/local/bin/kubectl apply -f blue_deployment/deployment.yml
                        /usr/local/bin/kubectl apply -f blue_deployment/service.yml
                        /usr/local/bin/kubectl get pods
                    '''
                }
            }
        }

        stage('Redirect service to blue container') {
            when { branch 'blue'}
            steps {
                withAWS(
                    region:'us-west-2', 
                    credentials: 'aws_id',
                    endpointUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com'
                ){
                    sh '''
                        echo 'Redirect service to blue container'
                        /usr/local/bin/kubectl rollout status deployment blue-udacity-project-server
                        /usr/local/bin/kubectl get pods
                        /usr/local/bin/kubectl delete deployment green-udacity-project-server
                        /usr/local/bin/kubectl get pods
                    '''
                }
            }
        }

        stage('Deploy green container') {
            when { branch 'green'}
            steps {
                withAWS(
                    region:'us-west-2', 
                    credentials: 'aws_id',
                    endpointUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com'
                ){
                    sh '''
                        /usr/local/bin/kubectl apply -f green_deployment/deployment.yml
                        /usr/local/bin/kubectl apply -f green_deployment/service.yml
                        /usr/local/bin/kubectl get pods
                    '''
                }
            }
        }

        stage('Redirect service to green container') {
            when { branch 'green'}
            steps {
                withAWS(
                    region:'us-west-2', 
                    credentials: 'aws_id',
                    endpointUrl: 'https://B48B3355DD60FEEFFA39CEA0FEBF137D.gr7.us-west-2.eks.amazonaws.com'
                ){
                    sh '''
                        echo 'Redirect service to green container'
                        /usr/local/bin/kubectl rollout status deployment green-udacity-project-server
                        /usr/local/bin/kubectl get pods
                        /usr/local/bin/kubectl delete deployment blue-udacity-project-server
                        /usr/local/bin/kubectl get pods
                    '''
                }
            }
        }
    }
}