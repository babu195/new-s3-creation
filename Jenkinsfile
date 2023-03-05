pipeline {
    agent any
    stages {
        stage('added VCS') {
            steps {
                checkout scm
            }
        }
        stage('Initiation terraform') {          
            steps {
                sh ('terraform init')

            }
        }
        stage('validating Terraform File') {
            steps {
                sh ('terraform validate')
            }
        }
        stage('Apply to create bucket') {
            steps {
                sh ('terraform apply -auto-approve')
            }
        }

    }
}
