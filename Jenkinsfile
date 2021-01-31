pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'sudo apt install make'
        sh '''
                    sudo make install
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