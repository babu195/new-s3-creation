pipeline {
    agent any
    stages {
        stage('added VCS') {
            steps {
                git credentialsId: 'Git_Credentials',
                url: 'git@github.com:babu195/new-s3-creation.git',
                branch: 'main'
            }
        }
        stage('AWS') {
            steps {
                withCredentials([[
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
