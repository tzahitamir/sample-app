pipeline {

    agent {
      docker{
      alwaysPull true

      image '713117837264.dkr.ecr.eu-west-2.amazonaws.com/base_node.16.20-bullseye:latest'
      registryUrl 'https://713117837264.dkr.ecr.eu-west-2.amazonaws.com'
      registryCredentialsId 'ecr:eu-west-2:aws-credentials'
      args  '-v /var/run/docker.sock:/var/run/docker.sock'
            }
        }

    

    stages {
        stage ('Test ') {

            steps {
		        sh '$WORKSPACE/ops/k8s/deployment/test.bash'
                
            }
        }
        }
        
        
            
    
  
}
