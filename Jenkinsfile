pipeline {
    agent any

    stages {

        stage('Pull Latest Code') {
            steps {
                sh '''
                ssh khevi@app-lab "
                cd ~/new-docker-webapp &&
                git pull
                "
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                ssh khevi@app-lab "
                cd ~/new-docker-webapp &&
                docker build -t kossi-web .
                "
                '''
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
               sh '''
                ssh khevi@app-lab "
                cd ~/new-docker-webapp &&
                git pull &&
                docker-compose down &&
                docker-compose up -d --build
                "
                '''
            }
        }

    }
}