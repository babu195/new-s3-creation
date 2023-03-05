pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages { 
        stage('added VCS') {
            steps {
                checkout scm
            }
        }
        stage('Initiation terraform') {          
            steps {
                sh 'terraform init'

            }
        }
        stage('validating Terraform File') {
            steps {
                sh 'terraform validate'
            }
        }
                stage('validating Terraform File') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Apply to create bucket') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

    }
}
