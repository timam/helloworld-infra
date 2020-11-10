pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  environment {
    // Git Config
    IREPO = "helloworld-infra"
    MWREPO = "helloworld-spring"
    MWBRANCH = "master"

    // Slack configuration
    SLACK_CHANNEL       = "jenkins-poc"
    SLACK_COLOR_DANGER  = '#E01563'
    SLACK_COLOR_INFO    = '#6ECADC'
    SLACK_COLOR_WARNING = '#FFC300'
    SLACK_COLOR_GOOD    = '#3EB991'
  }

  parameters {
    choice(choices: ['sit', 'uat' , 'prod'], description: 'Select Environment', name: 'ENVIRONMENT')
    string(defaultValue: "develop", description: 'MW Release Tag:', name: 'MWRELEASETAG')

    choice( name: 'buildFrontendDockerImage', choices: "No\nYes", description: 'Do you want to build docker image for Frontend?' )
    choice( name: 'buildBackendDockerImage',  choices: "No\nYes", description: 'Do you want to build docker image for Backend ?' )

  }

  stages {
    stage ('WarmUP') {
      parallel {
        stage('Checkout Infra Code') {
          steps {
            script {
              if (params.ENVIRONMENT == 'sit') {
                IBRANCH = 'develop'
              }
              if (params.ENVIRONMENT == 'uat') {
                IBRANCH = 'develop'
              }
              if (params.ENVIRONMENT == 'prod') {
                IBRANCH = 'develop'
              }
            }
            git(url: "https://github.com/timam/${env.IREPO}", branch: "${IBRANCH}", credentialsId: 'devops')

          }
        }

        stage('Checkout MW & Build Artifacts'){
          when {
            anyOf {
              expression { params.buildFrontendDockerImage == "Yes" }
              expression { params.buildBackendDockerImage == "Yes" }
            }
          }
          steps{
            dir("${env.MWREPO}") {
              git(url: "https://github.com/timam/${env.MWREPO}", branch: "${MWBRANCH}", credentialsId: 'devops')
              sh "git reset --hard && git checkout ${params.MWRELEASETAG}"
            }
            sh "ansible-playbook ansible/artifacts_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT}"
          }
        }
        stage('Save Build Information'){
          steps{
            wrap([$class: 'BuildUser']){
              echo "Build Number : ${currentBuild.number}"
              echo "Build triggered by: ${BUILD_USER}"
              echo "Deployment Environment: ${params.ENVIRONMENT}"
              echo "Middleware Release Tag: ${params.MWRELEASETAG}"
              echo "Build Docker Image for Frontend Microservice: ${params.buildFrontendDockerImage}"
              echo "Build Docker Image for Backend Microservice: ${params.buildBackendDockerImage}"
            }
          }
        }
      }
    }

    stage ('Copy Artifacts') {
      parallel {
        stage('Copy Frontend Artifact') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/copy_artifacts.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=frontend"
          }
        }

        stage('Copy Backend Artifact') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/copy_artifacts.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=backend"
          }
        }
      }
    }

    stage ('Build Docker Image') {
      parallel {
        stage('Frontend Docker Image Build') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/image_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=frontend"
          }
        }

        stage('Frontend Docker Image Build') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/image_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=backend"
          }
        }
      }
    }
    //Add New Stage Here

    //
  }

  // POST Actions

}