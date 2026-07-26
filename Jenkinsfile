pipeline {
    agent any
    tools{
        maven 'Maven-3.9.16'
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Webcam23/devops-automation']])
                bat 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                bat 'docker build -t webcam23/devops-integration .'
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        bat 'docker login -u webcam23 -p %dockerhubpwd%'
                        bat 'docker push webcam23/devops-integration'
                    }
                }
            }
        }
    }
}