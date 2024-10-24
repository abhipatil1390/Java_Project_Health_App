@Library('my-shared-lib') _
pipeline {
    agent any
    parameters {
        string(name: 'VERSION', defaultValue: 'latest', description: 'Version to Rollback or Deploy')
    }
    tools {
        jdk 'Jdk17'
        maven 'Maven3'
        }
    environment {
        // Set the JAVA_HOME environment variable to point to the JDK 17 installation path.
        JAVA_HOME = '/var/jenkins_home/tools/hudson.model.JDK/Java17'
        DOCKER_USER_NAME = "abhipatil1390"
        APP_NAME = "javaproject02"
        RELEASE = "1.0.0"
        //DOCKER_PASS = credentials('dockerpass')
        IMAGE_NAME = "${DOCKER_USER_NAME}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "latest"
        }           
    stages {
         stage("Cleanup Workspace"){
            steps {
                cleanWs()
                }  

           }
        stage("Code Checkout") {
            steps{
                script{
                    try {
                      github('https://github.com/abhipatil1390/Java_Project_Health_App.git', 'master')
                      //git branch: 'master', credentialsId: 'github', poll: false, url: 'https://github.com/abhipatil1390/Java_Project_Health_App.git'
                      echo "${params.VERSION}"
                    }
                    catch (Exception e) {
                        echo "Code Checkout is failed: ${e.message}"
                        error("Code Checkout is failed")
                    }
                }
            } 
        }
        stage('Build Application') {
            steps {
                script{
                 try {
                     mvn()
                 }
                       catch (Exception e) {
                        echo "failed mvn"
                        error("Build Application is failed")
                    }
            }
            }
            }
        stage("Test Application"){
            steps {
                script{
                  sh 'mvn test'
                  sh 'echo " MVN Test successfully"'
                 sh 'chmod +x /home/ubuntu01/.jenkins/workspace/healthapp/target/*.jar'
                }
              
            }
        }
        stage("Docker Build and Push Image to DockerHub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerpass', variable: 'DOCKER_PASS')]) {
                      sh ('docker login -u $DOCKER_USER_NAME -p $DOCKER_PASS') 
                    }
                 //sh ('docker login -u $DOCKER_USER_NAME -p $DOCKER_PASS')   
                 sh  'echo "ogin successfully"'
                 sh ' docker build . -t ${IMAGE_NAME}:latest'
                 sh ' docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:latest'
                 sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
                }
            }
        }
}
}
