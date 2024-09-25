pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/fiermarin2/test-jenkins'
            }
        }
        stage('Build Docker container') {
            steps {
                script {
                    sh 'docker build -t my-container .'
                }
            }
        }
        stage('Run container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 --name my-container my-container'
                }
            }
        }
    }
    triggers {
        pollSCM('0 * * * *') // Verifica cambios cada minuto
    }
}
