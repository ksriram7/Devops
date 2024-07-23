pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t "ksriram7/devopsapp" .'
                    } else {
                        bat 'docker build -t "ksriram7/devopsapp" .'
                    }
                }
            }
        }

        stage('Run Docker container') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker run -d -p 5000:5000 --name devopsapp ksriram7/devopsapp'
                    } else {
                        bat 'docker run -d -p 5000:5000 --name devopsapp ksriram7/devopsapp'
                    }
                }
            }
        }

        stage('Test application') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'curl http://localhost:5000'
                    } else {
                        bat 'curl http://localhost:5000'
                    }
                }
            }
        }

        stage('Push Docker image to Docker Hub') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker login -u ksriram7 -p Drona@123#'
                        sh 'docker push ksriram7/devopsapp'
                    } else {
                        bat 'docker login -u ksriram7 -p Drona@123#'
                        bat 'docker push ksriram7/devopsapp'
                    }
                }
            }
        }
    }
}
