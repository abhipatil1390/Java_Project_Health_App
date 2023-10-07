
pipeline {
    agent any

    tools {
        jdk 'Jdk17'
        maven 'Maven3'
        }
    environment {
        // Set the JAVA_HOME environment variable to point to the JDK 17 installation path.
        JAVA_HOME = '/var/jenkins_home/tools/hudson.model.JDK/Java17'
        DOCKER_USER_NAME = "abhipatil1390"
        APP_NAME = "first_app03"
        RELEASE = "1.0.0"
        DOCKER_PASS = credentials('dockerpass')
        IMAGE_NAME = "${DOCKER_USER_NAME}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
        }
    stages {
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
                }  

           }
        stage("Code Checkout") {
            steps{
                  git branch: 'master', credentialsId: 'github', poll: false, url: 'https://github.com/abhipatil1390/Java_Project_Health_App.git'
                 } 
        }
        stage('Build the Application') {
            steps {
                  sh "mvn clean package"
            }
            }
        stage("Test the Application"){
            steps {
                script{
                  sh "mvn test"
                  sh 'echo "Test successfull"'  
                }
              
            }
        }

        stage("Docker build and push image") {
            steps {
                script {
                 sh ('docker login -u $DOCKER_USER_NAME -p $DOCKER_PASS')   
                 sh " echo 'login successfully '"
                 sh " docker build . -t ${IMAGE_NAME}:${IMAGE_TAG}"
                 sh " docker images"
                 sh " docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_TAG}"
                 sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        
        }
        stage("Deploy the application"){
            steps { 
                script{
                  sh ('docker run -d -p 8000:8000 --name $APP_NAME $IMAGE_NAME:$IMAGE_TAG') 
                }
              
            }
        }
}
}
