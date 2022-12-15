
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo ' This is in the root of the master branchHello World'
                sh 'printenv'
                sh 'A=`echo $GIT_BRANCH | awk -F "=" \'{print $1}\' | sed -e \'s/.$//\'` | if [ $A = "PR-" ] ;then  PR=1 && echo this is a PR; fi'
            }
        }
    }
}
