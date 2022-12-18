
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo ' This is in the root of the master branchHello World'
                sh 'printenv'
                #sh 'A=`echo $GIT_BRANCH | awk -F "=" \'{print $1}\' | sed -e \'s/.$//\'` | if [ $A = "PR-" ] ;then  PR=1 && echo this is a PR; fi'
                if [ $GIT_BRANCH = master ] ;then echo this is master ;elif [ `echo $GIT_BRANCH | grep ^PR-` ] ;then echo this is a PR;else echo "return -1";fi
            }
        }
    }
}
