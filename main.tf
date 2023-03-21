# We have an EC2 instance in AWS that needs to come under Terraform control
# We do this by creating the AWS resource here.

resource "aws_instance" "myinstance" {
  ami           = "ami-05502a22127df2492"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0dc9ce31833103bec"
  vpc_security_group_ids = [aws_security_group.vpc-ssh_new.id, aws_security_group.vpc-web_new.id]
}

