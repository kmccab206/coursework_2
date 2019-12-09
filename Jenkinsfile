pipeline {
    agent none {
        stages {
            stage('SonarQube Analysis') {
                steps {
                    echo "Testing..."
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
}