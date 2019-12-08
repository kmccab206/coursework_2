pipeline {
    agent { docker { image 'node:6.3' } }
    stages {
        stage('Build') {
            steps {
                sh 'npm --version'
            }
        }
         stage('Static Analysis') {
            environment {
                scanner = tool 'SonarQubeScanner'
            }
            steps {
               withSonarQubeEnv('SonarQube') {
                    sh "${scanner}/bin/sonar-scanner"
                  }
               timeout(time: 10, unit: 'MINUTES') {
                              waitForQualityGate abortPipeline: true
                          }
                      }
                  }
                }
    }
