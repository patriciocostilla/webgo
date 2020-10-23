pipeline {
    agent { label 'docker'}
    

    stages {
        stage('Build') {
            steps {
                container('docker') {
                    script {
                        sh 'docker build -t webgo .'
                    }
                }
            }
        }
    }
}