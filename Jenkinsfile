
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
        APP_NAME = "javaproject"
        RELEASE = "1.0.0"
        DOCKER_PASS = credentials('dockerpass')
        IMAGE_NAME = "${DOCKER_USER_NAME}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
        }
    stages {
        stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "Deploymentservice.yaml", kubeconfigId: "kuberneties")
        }
      }
    }
}
}
