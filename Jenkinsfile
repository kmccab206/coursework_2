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
                        def scannerHome = tool 'SonarScanner';
                            withSonarQubeEnv('SonarQube') { // If you have configured more than one global server connection, you can specify its name
                              sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
    }
}