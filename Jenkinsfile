pipeline {
  agent any
    stages {
    stage('Build') {
      steps {
        //sh 'mvn package -Dmaven.clean.failOnError=false'
        sh 'mvn package'
      }
      post {
        success {
          archiveArtifacts 'target/*.jar'
        }
      }
    }
    stage('Deploy') {
    steps {
        script {
            def dockerImage = 'my-app'
            def dockerImageTag = "${dockerImag}:${env.BUILD_NUMBER}"
            def dockerRegistry = 'docker.io/v1'
            def dockerRepo = 'masnawirahmat'

            withCredentials([usernamePassword(credentialsId: 'mydockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh "echo $PASSWORD | docker login --username $USERNAME --password-stdin ${dockerRegistry}"
                sh "docker tag ${dockerImageTag} ${dockerRegistry}/${dockerRepo}/${dockerImage}:${env.BUILD_NUMBER}"
                sh "docker push ${dockerRegistry}/${dockerRepo}/${dockerImage}:${env.BUILD_NUMBER}"
                sh "docker logout"
            }
          }
        }
      }
    }
  }





