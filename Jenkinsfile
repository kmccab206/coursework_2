pipeline {
    agent any {
        stages {
            stage('SonarQube Analysis') {
                steps {
                    echo "Testing..."
                }
            }
            stage('Build') {
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
}