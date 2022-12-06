pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:'https://github.com/Krishna8074123/test1.git',
                branch:'master'
            }
        }
        stage('docker'){
            steps{
                sh script: 'docker info'
            }
        }
        stage('spring')
        steps{
            sh script: 'docker image build -d spring:1.0 . '
        }
    }
}