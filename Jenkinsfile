pipeline {
    agent any
    stages {
        stage('added VCS') {
            steps {
                checkout scm
            }
        }
        stage('AWS') {
            steps {
                withcredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentials',
                    accesskeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretkeyVariable: 'AWS_SECRET_ACCESS_KEY']])
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
