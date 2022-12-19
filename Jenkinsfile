
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
		script{	
               	 sh 'printenv'
		 if (env.GIT_BRANCH == 'master') 
			{
		 	echo 'triget a build for master'
       			}	
		}
    	}
 }
 }
}
