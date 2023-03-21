# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = "terraform-key"
  count                  = var.ec2_instance_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to the demo using Terraform/Jenkins in us-east-2 Region</h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.vpc-ssh_new.id, aws_security_group.vpc-web_new.id]
  tags = {
    "Name" = "myec2vm"
  }
}

# We have an EC2 instance in AWS that needs to come under Terraform control
# We do this by creating the AWS resource here.

# resource "aws_instance" "myinstance" {
#   ami           = "i-043bb25f5dff8b6b2"
#   instance_type = "t2.micro"
#   subnet_id     = "subnet-0dc9ce31833103bec"
#   vpc_security_group_ids = ["sg-0506c8159507d6480", "sg-0506c8159507d6480"]
# }


