pipeline {
    agent any
    stages {
        //Testing stage in DevOps Pipeline, could use a number of testing tools e.g. JUnit for unit testing
        //Using SonarQube for static code analysis here
        stage('SonarQube Static Analysis') {
            environment {
                sqscanner = tool 'SonarQubeScanner'
            }

            steps {
                withSonarQubeEnv('SonarQube') {
                    echo 'Starting static code analysis (SonarQube)...'
                    sh "${sqscanner}/bin/sonar-scanner"
                }

                timeout(time: 12, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Build') {
            //Build stage where the project is built
            echo 'Starting Build stage...'
            agent { docker { image 'node:6.3' } }
        }
        stage('Package Build') {
            //Package stage, using Docker to package the build (create a docker image)
            steps {
                script {
                    echo 'Starting Packaging with Docker...'
                    app = docker.build("kmccab206/coursework2")
                }
            }
        }
        stage('Push Build') {
            //Push stage where the docker image is pushed to DockerHub
            steps {
                echo 'Pushing image to DockerHub...'
                script {
                    //docker-hub-credentials set within the credentials area on Jenkins (No plain text passwords)
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('Deploy to Production') {
            //Deployment stage where the latest image is automatically deployed on the prod VM
            echo 'Starting Deployment...'
            sh 'ssh cwuser@52.176.53.14 kubectl set image deployments/DevOpsCW2 web=docker.io/kmccab206/coursework2:latest'
        }
    }
}