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

        stage('Deploy Container') {
            steps {
                sh '''
                ssh khevi@app-lab "
                docker rm -f myweb 2>/dev/null || true &&
                docker run -d -p 8080:80 --name myweb kossi-web
                "
                '''
            }
        }

    }
}