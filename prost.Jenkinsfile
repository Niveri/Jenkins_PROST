pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
	            cmakeBuild buildType: 'Debug', 
                    installation: 'InSearchPath', 
                    cleanBuild: true, 
                    steps: [[withCmake: true]]
		    }
	    }

        stage('Test') {
            steps {
                ctest 'InSearchPath'
            }
            post {
                success {
                    sh "echo success handler"
                }
                failure {
                    sh "echo failure handler"
                }
                aborted {
                    sh "echo aborted handler"
                }
            }
        }

        stage('Publish') {
           
            steps {
              
               sh "build docker image"
               sh 'docker build -f "Dockerfile" -t niveri/prost:$BUILD_NUMBER .'
	       sh "publish docker image "
               withDockerRegistry([ credentialsId: "niveri", url: "" ]) {
                 sh 'docker push niveri/prost:$BUILD_NUMBER'
                }
                
              
              
            }
        }
    }
}
