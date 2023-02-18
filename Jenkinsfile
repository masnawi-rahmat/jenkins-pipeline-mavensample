pipeline {
    agent any
    /*tools {
        maven 'Maven 3.6.3'
    }*/
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t myapp .'
                sh 'docker run -d -p 8081:8081 myapp'
            }
        }
    }
}
