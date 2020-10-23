pipeline {
    agent { label 'docker'}

    environment {
        dockerImage = ''
        credentials = 'docker-hub'
    }

    stages {
        stage('Build') {
            steps {
                container('docker') {
                    script {
                        dockerImage = docker.build "patriciocostilla/webgo:${BUILD_NUMBER}"
                    }
                }
            }
        }
        stage('Publish') {
            steps {
                container('docker') {
                    script {
                        docker.withRegistry('', credentials) {
                            dockerImage.push()
                        }  
                    }
                }
            }
        }
    }
}