pipeline{
    agent {label 'DOCKER'}
    stages{
        stage('branch'){
            steps{
                git url: 'https://github.com/Krishna8074123/test1.git',
                branch: 'master'
            }
        }
        stage('docker'){
            steps{
                sh script: 'docker image pull jenkins/jenkins'
            }
        }
    }
}