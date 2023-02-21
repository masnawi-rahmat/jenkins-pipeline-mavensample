pipeline {
  agent any
  environment  
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
          withCredentials([usernamePassword(credentialsId: 'mydockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            docker.withRegistry("https://hub.docker.com/repository/docker/masnawirahmat/masdockerhub", "mydockerhub") {
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


