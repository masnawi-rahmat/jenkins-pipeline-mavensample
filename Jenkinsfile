pipeline {
    agent any
    tools {
        maven 'Maven 3.8.2'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t myapp .'
                sh 'docker run -d -p 8081:8080 myapp'
            }
        }
    }
}
