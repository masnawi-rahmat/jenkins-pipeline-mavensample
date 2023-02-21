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
          withDockerRegistry([url: 'https://hub.docker.com/repository/docker/masnawirahmat/masdockerhub', credentialsId: 'mydockerhub']) {
            docker.withRegistry('', '') {
              def image = docker.build("my-app:${env.BUILD_NUMBER}")
              image.push()
           docker.withRegistry('https://hub.docker.com/repository/docker/masnawirahmat/masdockerhub', 'mydockerhun') {
             def image = docker.build("my-app:${env.BUILD_NUMBER}")
             withCredentials([usernamePassword(credentialsId: 'mydockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
               docker.withRegistry("https://index.docker.io/v1/", "Docker Hub") {
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


