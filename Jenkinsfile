pipeline {
    agent { dockerfile true }
    stages {
        stage('Run inside the container') {
            steps {
                sh 'node --version'
            }
        }
        stage ('Docker build and push')
        {
           steps{
                script{
                        docker.withRegistry('https://713117837264.dkr.ecr.eu-west-2.amazonaws.com','ecr:eu-west-2:aws-tzahi')
                            {
                            app.push("${env.BUILD_NUMBER}")
                            app.push("latest")
                        }
                    }
                }
        }
    }
}
