pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="us-east-2"
        THE_BUTLER_SAYS_SO=credentials('aws-creds')
    }
    stages {
        stage ("Creds") {
            steps {
                sh '''
                    aws --version
                    aws ec2 describe-instances
                '''
            }
        }
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }
        stage ("Terraform Format") {
            steps {
                sh ('terraform fmt')
            }
        }
        stage ("terraform validate script") {
            steps {
                sh ('terraform validate') 
            }
        }
        stage ("plan") {
            steps {
                sh ('terraform plan -var-file=myvars.tfvars -out myplan')
            }
        }
        stage ("state list") {
            steps {
                sh ('terraform state list')
            }
        }
        
        stage ("Validate apply") {
            input {
                message "Are you sure you want to apply this plan?"
                ok "Apply this plan."
            }
            steps{
                echo "Apply command has been accepted"
            }
        }
        stage ("Action step") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} -var-file=myvars.tfvars --auto-approve')
           }
        }
//         stage ("Delete Security Group") {
//             steps {
//                 sh 'terraform ${action} -var-file=myvars.tfvars -target=aws_instance.my-ec2-vm --auto-approve'
//             }
//         }
        
        stage ("Import EC2 Instance") {
            steps {
                sh 'terraform ${action} aws_instance.myinstance i-043bb25f5dff8b6b2'
            }
        }
        stage ("state list after deletion/addition") {
            steps {
                sh ('terraform state list')
            }
        }
    }
}

