pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:"https://github.com/Krishna8074123/test1.git",
                branch:"master"
            }
        }
        stage('docker'){
            steps{
                sh 'docker image build -t Krishna8074123/test1 .'
            }
        }
        stage('docker container'){
            steps{
                sh 'docker container run -d -P Krishna8074123/test1 '
            }
        }
        
    }
}
