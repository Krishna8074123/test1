pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:'https://github.com/spring-projects/spring-petclinic.git',
                branch:'main'
            }
        }
        stage('package'){
            steps{
                sh 'mvn package'
            }
        }
    }
}