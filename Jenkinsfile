pipeline {
// spin up docker with baseimage as build agent
// the docker file could be changed according to needed node versions etc.
//This is NOT the dockerfile at the root of the repo, which is used to build the actual app

// DO NOT PUSH THE SECRETES INTO THE REPO //

    agent {
      docker{
      alwaysPull true

      image '713117837264.dkr.ecr.eu-west-2.amazonaws.com/base-image-sample-app:0'
      registryUrl 'https://713117837264.dkr.ecr.eu-west-2.amazonaws.com'
      registryCredentialsId 'ecr:eu-west-2:aws-credentials'
      args  '-v /var/run/docker.sock:/var/run/docker.sock'
            }
        }
        
        node { 
    stage ("Checkout") {

        scmInfo = checkout scm

        /*...*/
        echo "scm : ${scmInfo}"
        echo "${scmInfo.GIT_COMMIT}"


    }
}


//GIT_PREVIOUS_SUCCESSFUL_COMMIT

    stages {
        stage('Clone the repo') {

            //when {
              // /         branch 'production'
            //}        
                        steps {
                        sh 'echo IN PRODUCTION BRANCH'
                        sh 'printenv'
                    }    
        }

        

        stage ('Build the app')
            {
                steps {
                        sh 'echo build stage'
            //            sh '/var/lib/jenkins/workspace/multi_master/build-script.sh'
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
               // sh 'echo build docker stage'
//                sh 'cd /var/lib/jenkins/workspace/pipe-multi_master ; docker build . -t 713117837264.dkr.ecr.eu-west-2.amazonaws.com/sample-app:"$GIT_COMMIT" --pull --force-rm --no-cache'
                sh 'echo perform docker push'
 //               sh 'docker push 713117837264.dkr.ecr.eu-west-2.amazonaws.com/sample-app:"$GIT_COMMIT"'
            }
        }
        stage ('Docker image test')
            {
                steps{
                     sh 'echo doing docker image test'   
                }
            }
        stage('check deployment is successful')
        {
            steps{
                sh 'echo checking deployment status'
		//sh '/var/lib/jenkins/workspace/pipe-multi_master/ops/k8s/sample-app/validate-k8s-deploy.sh'		
            }
        }

    }
}
