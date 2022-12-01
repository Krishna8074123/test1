pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:'https://github.com/Krishna8074123/test1.git',
                branch:'master'
            }
        }
        stage('terraform'){
            steps{
                sh '''
                sudo apt update
                curl -fsSL https://get.docker.com -oget-docker.sh
                sh get-docker.sh
                docker info'''
            }
        }
    }
}