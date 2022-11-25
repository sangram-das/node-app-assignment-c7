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
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.150.5.239 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 020897777613.dkr.ecr.us-east-1.amazonaws.com
                    sh 'ssh ubuntu@10.150.5.239 docker pull 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app:latest'
                    sh 'ssh ubuntu@10.150.5.239 docker pull 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app:latest'
                    sh 'ssh ubuntu@10.150.5.239 docker ps | grep 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app | cut -d " " -f 1 | xargs docker kill'
                    sh 'ssh ubuntu@10.150.5.239 docker docker run 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app'
                }
            }
        }
    }
}
