pipeline{
    agent {label 'docker'}
    stages{
        stage('branch'){
            steps{
                git url:"https://github.com/Krishna8074123/test1.git",
                branch:"master"
            }
        }
        stage('docker'){
            steps{
                sh script: "docker info"
            }
        }
    }
}