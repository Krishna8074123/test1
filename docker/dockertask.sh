pipeline {
    agent {
        node 'docker'
    }
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('branch') {
            steps {
                git branch: 'main', url: 'https://github.com/WorkshopsByKhaja/saleor-dashboard.git'
            }
        }
        stage('image build') {
            steps {
                sh 'terraform init'
            }
        }
        stage('image push') {
            steps {
                sh 'terrafrom apply --auto-approve'
            }
        }
    }
}
