pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Bitbucket repository
                git branch: 'master', credentialsId: 'bitbucket', url: 'git@bitbucket.org:payplusv2/test.git'
            }
        }
        stage('Print Previous Successful Commit') {
            steps {
                script {
                    // Print the value of GIT_PREVIOUS_SUCCESSFUL_COMMIT
                    echo "Previous successful commit: ${env.GIT_PREVIOUS_SUCCESSFUL_COMMIT}"
                }
            }
        }
    }
}