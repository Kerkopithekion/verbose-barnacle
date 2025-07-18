pipeline {
  agent any

  stages {
    stage("Clean up") {
      steps {
        sh "./cleanup.sh"
      }
    }

    stage("Trivy FS Scan") {
      steps {
        dir("trivy_scans") {
          sh "trivy fs --format json --output fs_scan.json .."
        }
        archiveArtifacts artifacts: "trivy_scans/fs_scan.json", onlyIfSuccessful: true
      }
    }

    stage("Build image from Dockerfile") {
      steps {
        sh "docker build -t flask_image ."
      }
    }

    stage("Trivy Image Scan") {
      steps {
        dir("trivy_scans") {
          sh "trivy image --format json --output image_scan.json flask_image"
        }
        archiveArtifacts artifacts: "trivy_scans/image_scan.json", onlyIfSuccessful: true
      }
    }

    stage("Run container") {
      steps {
        sh "docker run -d -p 5500:5500 --name flask_app flask_image"
      }
    }

    stage("Run Unit Test") {
      steps {
        sh "sleep 3"
        sh "python3 test_app.py"
      }
    }
  }
}
