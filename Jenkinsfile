pipeline {
    agent any

    environment {
        GIT_BRANCH = 'main' 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: 'https://github.com/Sanjaysaravanan20/Pyth.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sanjay2025/python-flask-app:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker push sanjay2025/python-flask-app:latest'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook -i hosts.ini deploy.yml'
            }
        }
    }
}
