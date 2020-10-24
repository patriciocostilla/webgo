pipeline {
    agent { label 'docker'}

    environment {
        dockerImage = ''
        credentials = 'docker-hub'
        kubernetesToken = credentials('kubernetes-token')
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
                            dockerImage.push('latest')
                        }  
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                container('kubectl') {
                    script {
                        sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify apply -f manifest.yml'
                    }
                }
            }
        }
    }
}