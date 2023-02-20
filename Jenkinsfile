pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
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
        withDockerRegistry([url: 'https://hub.docker.com/repository/docker/masnawirahmat/masdockerhub', credentialsId: '']) {
          docker.withRegistry('', '') {
            def image = docker.build("my-app:${env.BUILD_NUMBER}")
            image.push()
          }
        }
      }
    }
  }
}

