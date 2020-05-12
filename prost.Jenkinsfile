pipeline {
    environment {
        registry = "niveri/prost"
        registryCredential = 'niveri'
        dockerImage = ''
  }
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
           // agent { dockerfile true }
            steps {
                sh "echo"
                // sh "build docker image here"
                
               sh 'docker build -f "Dockerfile" -t niveri/prost:$BUILD_NUMBER .'
               withDockerRegistry([ credentialsId: "niveri", url: "" ]) {
                 sh 'docker push niveri/prost:latest'
                 
                }
                
                // sh "publish docker image here"
              
            }
        }
    }
}
