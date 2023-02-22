pipeline {
  agent any
    stages {
    stage('Build') {
      steps {
        //sh 'mvn package -Dmaven.clean.failOnError=false'
        sh 'mvn package'
        sh "docker build -t my-app . "
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
            //sh "docker build -t my-app ."
            def dockerImage = 'my-app'
            def dockerImageTag = "${dockerImage}:${env.BUILD_NUMBER}"
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





