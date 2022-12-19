
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo ' This is in the root of the master branchHello World'
                sh 'printenv'
		if (env.GIT_BRANCH == 'master') {
		 echo 'triget a build for master'
            }
    }
}
}
}
