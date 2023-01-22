pipeline {
// spin up docker with baseimage as build agent
// the docker file could be changed according to needed node versions etc.
//This is NOT the dockerfile at the root of the repo, which is used to build the actual app

// DO NOT PUSH THE SECRETES INTO THE REPO //

    agent {
      docker{
//      alwaysPull true
// NEED TO PUSH THE BASE IMAGE!!!!!!!!!

      image '713117837264.dkr.ecr.eu-west-2.amazonaws.com/payplus:2'
      registryUrl 'https://713117837264.dkr.ecr.eu-west-2.amazonaws.com'
      registryCredentialsId 'ecr:eu-west-2:aws-credentials'
      args  '-v /var/run/docker.sock:/var/run/docker.sock'
            }
        }

/////////////////////////////////////////////////////////////////////
    stages {
        stage('Clone the code to the from the repo') {
            steps {
//              sh 'node --version'
//              sh 'git --version'
                sh 'rm -rf test'
                sh 'rm -rf ops'
                sh 'git clone git@bitbucket.org:payplusv2/test.git'
                sh 'git clone git@bitbucket.org:payplusv2/ops.git'
            }
        }

        stage ('Build the app')
            {
                steps {
                        sh 'echo build stage'
                        sh '/var/lib/jenkins/workspace/pipe-multi_master/build-script.sh'
                        }
            }
        stage ('Test the app')    
            {
               steps {
                    sh 'echo Testing the app'
                }     
            }

        stage ('Docker build and push')
            {
           steps{
                sh 'echo build docker stage'
                sh 'cd /var/lib/jenkins/workspace/pipe-multi_master ; docker build . -t 713117837264.dkr.ecr.eu-west-2.amazonaws.com/payplus:"$GIT_COMMIT"'
                sh 'echo perform docker push'
                sh 'docker push 713117837264.dkr.ecr.eu-west-2.amazonaws.com/payplus:"$GIT_COMMIT"'
            }
        }
        stage ('Docker image test')
            {
                steps{
                     sh 'echo doing docker image test'   
                }
            }

        stage ('Deploy to k8s') 
        {
            steps{
                 sh 'echo deploy to k8s'  
//		 sh 'cat /var/lib/jenkins/repo/ops/k8s/deployment/sample-app.yaml.template | sed -e "s/imagename/713117837264.dkr.ecr.eu-west-2.amazonaws.com\\/payplus:$GIT_COMMIT/" > sample-app.$GIT_COMMIT.yaml'
//		 sh 'kubectl apply -f sample-app.$GIT_COMMIT.yaml'
//This should be the script for deploy		 sh '/usr/local/bin/deploy-to-k8s.sh $GIT_COMMIT'
            }
        }  

        stage('check deployment is successful')
        {
            steps{
                sh 'echo checking deployment status'
            }
        }
    }
}
