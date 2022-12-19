
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
				script{	
               		 sh 'printenv'
				 	if (env.GIT_BRANCH == 'master') 
						{
		 					echo 'triger a build for master'
							sh '/home/ubuntu/scripts/repo/test/master/master-build.sh'
       					}
						if (env.GIT_BRANCH =~ 'PR-') 
						{
		 					echo 'triger a PR flow'
							
       					}		
					}	
    			}
 			}
 		}
}
