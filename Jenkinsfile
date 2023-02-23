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
          def app = 'my-app'
            def version = env.BUILD_NUMBER
            def dockerRegistry = 'docker.io'
            def dockerUser = 'masnawirahmat'
            //def dockerPass = credentials('your-docker-hub-credentials-id')
            //def dockerImage = "${dockerUser}/${app}:${version}"
            withCredentials([usernamePassword(credentialsId: 'mydockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh "echo $PASSWORD | docker login --username $USERNAME --password-stdin ${dockerRegistry}"
                sh "docker tag ${app} ${dockerUser}/${app}:${version}"
                //sh "docker tag ${dockerImage} ${dockerRegistry}/${dockerRepo}:${dockerImage}-${dockerImageTag}"
                sh "docker push ${dockerUser}/${app}:${version}"
                //sh "docker push ${dockerRegistry}/${dockerRepo}:${dockerImage}-${dockerImageTag}"               
                sh "docker logout"
            }
          }
        }
      }
    }
  }
