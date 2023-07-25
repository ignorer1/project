pipeline {
    agent any
    environment {
        image_name="457810729834.dkr.ecr.eu-central-1.amazonaws.com/flaskapp"
        region="eu-central-1"
    }
    stages {
        satge("Build_and_Push") {
            steps {
                sh '''
                aws ecr get-login-password --region $region | docker login --username AWS --password-stdin 457810729834.dkr.ecr.eu-central-1.amazonaws.com
                docker build -t $image_name:latest .
                '''
            }
        }
        stage ("Push") {
            steps {
                sh '''
                docker push $image_name:latest
                '''
            }
        }
        stage("Deploy") {
            steps {
                sh '''
                help upgrade flask helm/ --install --wait --atomic
                '''
            }
        } 
    }
}
