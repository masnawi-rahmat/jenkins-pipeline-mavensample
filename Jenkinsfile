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
          //def image = docker.build("my-app:${env.BUILD_NUMBER}")
          withCredentials([usernamePassword(credentialsId: 'mydockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "echo $PASSWORD | docker login registry-1.docker.io/v1 --username $USERNAME --password-stdin"
            image.push("masnawi.rahmat/my-app:${env.BUILD_NUMBER})
            sh "docker logout"
            }
          }
        }
      }
    }
  }



