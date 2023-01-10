pipeline {
    agent { dockerfile true }
//      agent {
//      docker{
//      image 'node:19.3.0-bullseye'
 //       args  ' -v /var/run/docker.sock:/var/run/docker.sock'
//      }
//}
    stages {
        stage('Run inside the container') {
            steps {
                sh 'node --version'
            }
        }
        stage ('build')
            {
                steps {
                	sh 'echo build stage'
                //  script{
                	//app = docker.build("payplus")
                	//    }
                	}
            }

        stage ('Docker build and push')
            {
           steps{
               	sh 'echo build docker stage'
 //               script{
  //                      docker.withRegistry('https://713117837264.dkr.ecr.eu-west-2.amazonaws.com','ecr:eu-west-2:aws-tzahi')
   //                         {
    //                        app.push("${env.BUILD_NUMBER}")
     //                       app.push("latest")
      //                  }
                }
            }
        }
}

