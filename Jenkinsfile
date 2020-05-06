pipeline {
		agent any

		stages{
			stage('Build'){
				steps
				{
				 
				 cmakeBuild buildType: 'Debug', installation:'InSearchPath', cleanBuild: true, steps: [[withCmake: true]]

				}
			}
			
			
		}


}