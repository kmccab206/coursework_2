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
                script {
                    app = docker.build("kmccab206/coursework_2")
                }
            }
        }
        stage('Push Build') {
            steps {
                    script {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}