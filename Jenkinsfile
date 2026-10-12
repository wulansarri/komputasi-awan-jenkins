pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'kurniaragilwulansari/komputasi-awan-jenkins:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/wulansarri/komputasi-awan-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker Image...'
                    bat "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo 'Pushing Docker Image to Docker Hub...'
                    withCredentials([usernamePassword(credentialsId: 'ocker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        bat "docker login -u %DOCKER_USER% -p %DOCKER_PASS%"
                        bat "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}
