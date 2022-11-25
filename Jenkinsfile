pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout main
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                 app = docker.build("assignment-c7-916-app")
                }
            }
        }

        stage('Deploy') {
            steps {
                script{
                    docker.withRegistry('https://720766170633.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
    }
}
