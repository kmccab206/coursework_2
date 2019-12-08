pipeline {
    agent { docker { image 'node:6.3' } }
    stages {
        stage('Build') {
            steps {
                sh 'npm --version'
            }
        }
         stage('Static Analysis') {
                    steps {
                        sh "SonarQube/bin/sonar-scanner"
                    }
                }
    }
}