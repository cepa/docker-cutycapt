pipeline {
  agent { label 'docker' }

  triggers {
    pollSCM('H/3 * * * *')
    cron('H H * * *')
  }

  stages {

    stage('Clean Up') {
      steps {
        sh 'sudo docker stop cutycapt || true'
        sh 'sudo docker rm cutycapt || true'
      }
    }

    stage('Checkout') {
      steps {
        checkout([
          $class: 'GitSCM',
          userRemoteConfigs: [[url: 'https://github.com/loskoderos/cutycapt-docker.git']],
          branches: [[name: '*/master']],
        ])
      }
    }

    stage('Build') {
      steps {
        sh 'sudo docker build --no-cache -t cutycapt .'
      }
    }

    stage('Test') {
      steps {
        sh 'rm -f google.png'
        sh 'sudo docker run --rm -v "$PWD:/out" --name cutycapt cutycapt bash -c "sleep 1; xvfb-run -a -l -e /dev/stdout cutycapt --url=http://google.com --out=/out/google.png"'
        sh 'ls -alh google.png'
      }
    }
  }
}
