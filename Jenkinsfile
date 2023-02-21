pipeline {
  agent any
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
          withDockerRegistry([url: '', credentialsId: '']) {
            docker.withRegistry('', '') {
              def image = docker.build("my-app:${env.BUILD_NUMBER}")
              image.push()
            }
          }
        }
      }
    }
  }
}


