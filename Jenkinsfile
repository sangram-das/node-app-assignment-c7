pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
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
        stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        stage('Deploy') {
            steps {
                script{
                    docker.withRegistry('https://020897777613.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:AWS-assignment-c7') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
        stage('Deploy Docker') {
            steps {
                script{
                    docker.withRegistry('https://020897777613.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:AWS-assignment-c7') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
        stage ('Update Docker Image') {
            steps{
                sshagent(credentials : ['b083cd92-e899-4104-b1ae-69053d78e995']) {
                    sh 'ssh ubuntu@10.150.5.239 source restart_docker.sh'
                }
            }
        }
    }
}
