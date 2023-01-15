pipeline {
//    agent { dockerfile true }
      agent {
      docker{
      image '713117837264.dkr.ecr.eu-west-2.amazonaws.com/payplus:1'
 //       args  ' -v /var/run/docker.sock:/var/run/docker.sock'
      }
}
    stages {
        stage('Run inside the container') {
            steps {
                sh 'node --version'
                sh 'git --version'
		sh 'rm -rf test'
		sh 'git clone git@bitbucket.org:payplusv2/test.git'
            }
        }
        stage ('build')
            {
                steps {
                	sh 'echo build stage'
                	sh '/var/lib/jenkins/workspace/pipe-multi_master/build-script.sh'
                //  script{
                	//app = docker.build("payplus")
                	//    }
                	}
            }

        stage ('Docker build and push')
            {
           steps{
               	sh 'echo build docker stage'
		sh 'cd /var/lib/jenkins/workspace/pipe-multi_master ; docker build . -t sample-app:$GIT_COMMIT"'
            }
        }
}

