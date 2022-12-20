pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
				script{	
               		sh 'printenv'
				 	if (env.GIT_BRANCH == 'master') 
						{
		 					echo 'trigger a build for master'
							docker.image('ubuntu').inside {
  								 sh '/var/lib/jenkins/workspace/scripts/payplus/test/master/master-build.sh'
								}
       					}
						if (env.GIT_BRANCH == 'production') 
						{
		 					echo 'triger a production flow'
       					}		
					}	
    			}
 			}
 		}
}
