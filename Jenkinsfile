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
                      if (env.BRANCH_NAME == 'develop') {
                        dockerImage = docker.build "patriciocostilla/webgo:${BUILD_NUMBER}"
                      } else {
                        echo "Skipping Build"
                      }
                    }
                }
            }
        }
        stage('Publish') {
            steps {
                container('docker') {
                    script {
                      if (env.BRANCH_NAME == 'develop') {
                        docker.withRegistry('', credentials) {
                          dockerImage.push()
                          dockerImage.push('latest')
                        }
                      } else {
                        echo "Skipping Publish"
                      }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                container('kubectl') {
                    script {
                        if (env.BRANCH_NAME == 'main') {
                          sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify apply -f manifest.prod.yml'
                        } else {
                          sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify apply -f manifest.yml'
                        }
                    }
                }
            }
        }
    }
}