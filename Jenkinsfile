pipeline {
    agent any

    environment {
        REPO_PATH = 'file:///var/jenkins_home/test-jenkins'
        CONTAINER_NAME = 'contenedor-aplicacion'
        IMAGE_NAME = 'imagen-aplicacion'
        HOST_PORT = '8000'
        CONTAINER_PORT = '8000'
    }

    stages {
        // Clonar el repositorio desde una ruta local
        stage('Clonar repositorio local') {
            steps {
                git branch: 'main', url: "${REPO_PATH}"
            }
        }

        // Construir la imagen Docker para la aplicación
        stage('Construir imagen Docker') {
            steps {
                script {
                    echo 'Construyendo la imagen Docker para la aplicación...'
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        // Detener y eliminar contenedores antiguos si existen
        stage('Detener y eliminar contenedor anterior') {
            steps {
                script {
                    echo 'Verificando si el contenedor de la aplicación está corriendo...'
                    def isAppRunning = sh(script: "docker ps -a --filter 'name=${CONTAINER_NAME}' -q", returnStdout: true).trim()
                    if (isAppRunning) {
                        echo 'El contenedor de la aplicación existe. Deteniendo y eliminando...'
                        sh "docker rm -f ${CONTAINER_NAME}"
                    }
                }
            }
        }

        // Ejecutar nuevo contenedor de la aplicación
        stage('Ejecutar nuevo contenedor de la aplicación') {
            steps {
                script {
                    echo 'Ejecutando el nuevo contenedor de la aplicación...'
                    sh "docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizado.'
        }
        success {
            echo 'Pipeline ejecutado exitosamente.'
        }
        failure {
            echo 'El pipeline falló.'
        }
    }
}
