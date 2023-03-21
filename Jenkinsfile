pipeline {
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages{
        stage('Build Maven Project'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/brahmakothapalli/build-docker-image']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Dockerfile'){
            steps{
                script{
                    sh 'sudo docker build -t brahmakothapalli/build-docker-image .'
                }
            }
        }
        stage('Push docker image to Docker Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'bkdockerhub', variable: 'dockerhubpwd')]) {
                        sh 'sudo docker login -u brahmakothapalli -p ${dockerhubpwd}'
                    }
                    sh 'sudo docker push brahmakothapalli/build-docker-image'
                }
            }
        }
        stage('Run docker image'){
            steps{
                script{
                    sh 'sudo docker run brahmakothapalli/build-docker-image'
                }
            }
        }
    }
}