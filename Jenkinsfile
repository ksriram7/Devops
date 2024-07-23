pipeline {
    agent any
    
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/ksriram7/Devops.git'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build("ksriram7/devopsapp")
                }
            }
        }
        stage('Run Docker container') {
            steps {
                script {
                    dockerImage.run('-d -p 5000:80')
                }
            }
        }
        stage('Test application') {
            steps {
                sh 'curl http://localhost:5000'
            }
        }
        stage('Push Docker image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
