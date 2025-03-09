pipeline {
    agent any

    environment {
        GIT_BRANCH = 'main'  // Change this if using a different branch
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: 'https://github.com/your-username/python-flask-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-docker-repo/python-flask-app:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker push my-docker-repo/python-flask-app:latest'
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
