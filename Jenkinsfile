pipeline {
  agent {
      label 'slave'
    }
  stages {
      stage('CleanUp WorkSpace & Git Checkout') {
          steps {
              // Clean before build
              cleanWs()
              // We need to explicitly checkout from SCM here
              checkout scm
           }
       }	
      stage('Build & Test') {
	   agent {
    	      docker {
      	          image 'pythontest:latest'
                  reuseNode 'true'
    	      }
  	   }
	   steps {
	      sh 'python3 -m pytest'
	   }
       }
       stage('Code Analysis') {
	   environment {
	      scannerHome = tool 'SonarQube Scanner'
	   }
	   steps {
	      withSonarQubeEnv('admin') {
	         sh '${scannerHome}/bin/sonar-scanner \
	           -D sonar.projectKey=python-app'	
	      }
           }
        }
        stage('Deploy Atrifacts') {
           steps {
               rtUpload (
                   serverId: 'JFrog',
                   spec: '''{
                      "files" :[
                            {
                               "pattern": "coverage/",
                               "target": "python-ci/"
                            }
                       ]
                   }'''
               )
            }
        }
    }
