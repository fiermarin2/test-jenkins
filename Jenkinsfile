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
                    sh 'docker run -d --name my-container my-container'
                }
            }
        }
    }
    triggers {
        pollSCM('* * * * *') // Verifica cambios cada minuto
    }
}
