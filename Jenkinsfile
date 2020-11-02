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
                          dockerImage.push('dev')
                        }
                      } else {
                        echo "Skipping Publish"
                      }
                    }
                }
            }
        }
        stage('Promote') {
            steps {
                container('docker') {
                    script {
                      if (env.BRANCH_NAME == 'main') {
                        docker.withRegistry('', credentials) {
                          def image = docker.image("patriciocostilla/webgo:dev")
                          image.pull()
                          image.push('latest')
                        }
                      } else {
                        echo "Skipping Promote"
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
                          sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify rollout restart'
                        } else {
                          sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify apply -f manifest.yml'
                          sh 'kubectl --server https://10.0.2.10:6443 --token=${kubernetesToken} --insecure-skip-tls-verify rollout restart'
                        }
                    }
                }
            }
        }
    }
}