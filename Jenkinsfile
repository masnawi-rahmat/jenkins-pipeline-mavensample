pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Dockerize') {
            steps {
                sh 'docker build -t my-app .'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8443:8443 my-app'
            }
        }
    }
}
