pipeline {
  agent any
  stages {
      stage("Clean up"){
        steps {
          sh "./cleanup.sh"
        }
      }
      stage("Build image from Dockerfile"){
        steps {
          sh "docker build -t flask_image ."
        }
      }
      stage("Run container"){
        steps {
          sh "docker run -d -p 5500:5500 --name flask_app flask_image"
          sh ""
        }
      }
  }
}
