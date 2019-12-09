pipeline {
    agent { docker { image 'node:6.3' } }
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




/*stage('Build image') {
    /* This builds the actual image; synonymous to
     * docker build on the command line */
    /*steps {
        app = docker.build("devopsCWnode")
    }
}*/