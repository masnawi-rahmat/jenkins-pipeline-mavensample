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


