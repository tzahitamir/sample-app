pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Bitbucket repository using git step
                git branch: 'master', credentialsId: 'bitbucket', url: 'git@bitbucket.org:payplusv2/test.git'
            }
        }
        stage('Print Checkout Details') {
            steps {
                script {
                    // You can access the Git details directly without using checkout scm again
                    def checkoutDetails = checkout scm
                    echo checkoutDetails.toString()
                    echo "Git details: ${env.BRANCH_NAME} ${env.GIT_COMMIT} ${env.GIT_URL} ${env.GIT_PREVIOUS_SUCCESSFUL_COMMIT}"
                }
            }
        }
    }
}