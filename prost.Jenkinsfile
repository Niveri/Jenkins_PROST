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
                sh "echo"
                // sh "build docker image here"
                
                 sh 'docker build "niveri/prost-jenkins:$BUILD_NUMBER" '
                
                // sh "publish docker image here"
              
            }
        }
    }
}
