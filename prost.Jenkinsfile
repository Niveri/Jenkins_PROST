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
            agent { dockerfile true }
            steps {
                sh "echo"
                // sh "build docker image here"
                
               //  sh 'docker build -t "niveri/prost:$BUILD_NUMBER ." '

                
                // sh "publish docker image here"
              
            }
        }
    }
}
