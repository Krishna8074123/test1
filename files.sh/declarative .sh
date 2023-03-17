pipeline{
    agent any
    stages{
        stage('branch'){
            steps{
                git url:'https://github.com/spring-projects/spring-petclinic.git',
                branch:'main'
            }
        }
        stage(artifacts){
            steps{
                rtMavenDeployer (
                    id: 'jenkins',
                    serverId: 'jenkins-maven',
                    releaseRepo: 'jenkins-maven-libs-release-local',
                    snapshotRepo: 'jenkins-maven-libs-snapshot-local',
                    deployArtifacts: true,
                )
            }
        }
        stage('build code') {
            steps{
                rtMavenRun (
                    tool: 'maven',
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'jenkins',
                )
            }
        }
    }
}