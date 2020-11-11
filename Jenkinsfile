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
        stage('Get Infra Infra Code') {
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

        stage('Checkout & Build Artifacts'){
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
              script {
                MW_GIT_TAG_ID = sh (
                script: 'git log --format="%H" -n 1',
                returnStdout: true
                ).trim()
              }
            }
            sh "ansible-playbook ansible/artifacts_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT}"
          }
        }
        stage('Docker System Prune'){
          when {
            anyOf {
              expression { params.buildFrontendDockerImage == "Yes" }
              expression { params.buildBackendDockerImage == "Yes" }
            }
          }
          steps{
            sh "docker system prune -af"
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

    stage ('Docker Build') {
      parallel {
        stage('Frontend Docker Image Build') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/image_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=frontend"
          }
        }

        stage('Backend Docker Image Build') {
          when {
            expression { params.buildFrontendDockerImage == "Yes" }
          }
          steps {
            sh "ansible-playbook ansible/image_build.yaml -e workspace=${workspace} -e helloworldMW=${MWREPO} -e env=${params.ENVIRONMENT} -e module=backend"
          }
        }
      }
    }
    stage('Terraform Plan') {
      steps {
        input('Are the Docker Image builds complete?')
        dir('terraform') {
          sh "terraform init"
          sh "terraform workspace select ${params.ENVIRONMENT} || terraform workspace new ${params.ENVIRONMENT}"
          sh "terraform plan -var='helm_version=${MW_GIT_TAG_ID}' -out=myplan"
        }
      }
    }
    stage('Approval') {
      steps {
        script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [[$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm']])
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh "terraform apply -input=false myplan"
        }
      }
    }
    //Add New Stage Here

    //
  }

  // POST Actions

}