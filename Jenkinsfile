pipeline {
    agent any
    stages {
        stage('SonarQube Analysis') {
            steps {
                echo "Testing ..."
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
                app = docker.build("devopsCWnode")
            }
        }
        stage('Push Build') {
            steps {
                echo "Pushing Build to Dockerhub"
            }
        }
    }
}