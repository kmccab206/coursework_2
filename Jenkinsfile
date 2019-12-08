peline {
         agent any
         stages {
                 stage('One') {
                 steps {
                     echo 'Hi, this is DevOps CW2'
                 }
                 }
                 stage('Two') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 stage('Three'){
                 steps {
                     echo "Running SonarQube"
                 }
                 }
  
              }
}

