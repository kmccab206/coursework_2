pipeline {
    agent any
    stages {
        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'SonarQubeScanner'
            }

            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }

                timeout(time: 12, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Build') {
            agent { docker { image 'node:6.3' } }
            steps {
                sh 'npm install'
            }
        }
        stage('Package Build') {
            steps {
                script {
                    app = docker.build("kmccab206/coursework2")
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
        stage('Test') {
            steps {
                sh 'ssh cwuser@40.77.63.237'
            }
        }
    }
}