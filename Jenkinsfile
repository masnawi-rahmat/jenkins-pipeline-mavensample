pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/user/my-maven-app.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t my-maven-app .'
            }
        }
        stage('Push Docker image') {
            steps {
                sh 'docker push my-maven-app'
            }
        }
    }
}
