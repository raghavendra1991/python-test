pipeline {
    agent any
    environment {
	    http_proxy = 'http://127.0.0.1:3128/'
	    https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }
       stages {


        stage("install pip dependencies") {
            agent { 
                docker {
                    label "docker" 
                    image "python:3.8"
                }   
            }
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh "pip install virtualenv"
                    sh "virtualenv venv"
                    sh "pip install -r requirements.txt "

                }
            }
        }
        stage ('Test') {
            steps {
                sh 'python3 -m pytest'
            }
        }
    }
}
