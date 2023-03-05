pipeline {
    agent any
    stages {
        stage('AWS') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'awscredentials',
                    accesskeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretkeyVariable: 'AWS_SECRET_ACCESS_KEY']])
            }
        }
        stage('added VCS') {
            steps {
                git url: 'https://github.com/babu195/s3-Bucket.git',
                branch: 'main'
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