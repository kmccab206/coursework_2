pipeline {
    agent none
    stages {
        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'SonarQubeScanner'
            }    steps {
                echo "Running SonarQube Static Code Analysis"
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }        timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Build') {
            agent { docker { image 'node:6.3' } }
            steps {
                sh 'npm --version'
            }
        }
        stage('Package Build') {
            steps {
                echo "Packaging Successful Build..."
            }
        }
        stage('Push Build') {
            steps {
                echo "Pushing Build to Dockerhub"
            }
        }
    }
}