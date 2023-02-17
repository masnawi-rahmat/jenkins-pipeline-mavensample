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
                sh 'docker run -d -p 3000:3000 my-app'
            }
        }
    }
}
