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
                        sh "/var/jenkins_home/sonarqube/sonar-scanner-3.3.0.1492-linux/"
                    }
                }
    }
}