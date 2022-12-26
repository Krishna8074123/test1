pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:"https://github.com/Krishna8074123/test1.git",
                branch:"master"
            }
        }
        stage('docke'){
            steps{
                sh 'docker info'
            }
        }
        stage('docker'){
            steps{
                sh 'docker image build -t krishna8074123/test1:1.0 Dockerfile.sh'
            }
        }
    }
}
