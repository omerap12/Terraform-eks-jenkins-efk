pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        EKS_CLUSTER_NAME = 'dev-cluster'
        NAMESPACE = 'default'
    }
    
    stages {
        stage('Install Helm') {
            steps {
                script {
                    sh '''
                        curl -fsSL -o get_helm.sh "https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3" -o "get_helm.sh"
                        chmod 700 get_helm.sh
                        ./get_helm.sh
                        echo "Helm installed successfully"
                        which helm
                    '''
                }
            }
        }

        stage('Install AWS CLI') {
            steps {
                script {
                    sh '''
                        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                        unzip -o awscliv2.zip
                        ./aws/install --update
                        echo "AWS CLI installed successfully"
                        which aws
                    '''
                }
            }
        }
        stage ('Connect to aws') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                                     string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                                        sh '''
                    aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"  && aws configure set aws_secret_access_key "$AWS_ACCESS_KEY_SECRET"  && aws configure set region "us-east-1"
                    '''
                    }
                    
                }
            }
        }
        stage ('Connect to EKS cluster') {
            steps {
                script {
                    sh "aws eks --region us-east-1 update-kubeconfig --name $EKS_CLUSTER_NAME"
                }
            }
        }
        stage ('Deploy binomi helm chart') {
            steps {
                script {
                    sh '''
                        helm repo add bitnami https://charts.bitnami.com/bitnami
                        helm repo update
                        helm install my-nginx-release bitnami/nginx --namespace $NAMESPACE
                    '''
                }
            }
        }
    }
    
    post {
        always {
            // Clean up resources, if needed
            sh 'rm -rf awscliv2.zip aws'
        }
    }
}
