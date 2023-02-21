pipeline {
  agent any
  environment {
    dockerhub=credentials('mydockerhub')
  stages {
    stage('Build') {
      steps {
        sh 'mvn package -Dmaven.clean.failOnError=false'
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
          def image = docker.build("my-app:${env.BUILD_NUMBER}")
          withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials-id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "echo $PASSWORD | docker login --username $USERNAME --password-stdin"
            image.push()
            sh "docker logout"
            }
          }
        }
      }
    }
  }
}


