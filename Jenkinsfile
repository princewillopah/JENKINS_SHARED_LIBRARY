def gv
// this is bug-fix-branch
pipeline {
    agent any
    tools {
        maven 'my-maven'
    }
    stages {
        stage("init") {  // this stage prepare/load the groovy functions in script.groovy file here
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }

        stage('Checkout Code') {
            steps {
                 echo "cloning repo to jenkins"
                 git 'https://github.com/princewillopah/JENKINS_SHARED_LIBRARY.git'
            }
        }
        stage("build jar") {
            steps {
                    script {

                        echo "building jar file"
                        sh 'mvn package'  
                    }            
                }

        }

        stage("build image") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'my-credentials', usernameVariable: 'MY_DOCKER__USERNAME', passwordVariable: 'MY_DOCKER_PASSWORD')]) {
                            // Here we use the USERNAME and PASSWORD variables in a git command
                    //   sh """
                    //      docker build -t princewillopah/nana-demo:version-1 .
                    //      echo ${MY_DOCKER_PASSWORD} | docker login -u ${MY_DOCKER__USERNAME} --password-stdin
                    //      docker push princewillopah/nana-demo:version-1
                    //    """
                     sh 'docker build -t princewillopah/nana-demo:version-1 .'
                     sh 'echo "$MY_DOCKER_PASSWORD" | docker login -u "$MY_DOCKER__USERNAME" --password-stdin'   
                     sh 'docker push princewillopah/nana-demo:version-1'  
                    } 
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying"
                    //gv.deployApp()
                }
            }
        }
    }   
}