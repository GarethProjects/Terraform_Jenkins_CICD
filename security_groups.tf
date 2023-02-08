# Input Variables
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-2"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-05bfbece1ed5beb54" # Amazon2 Linux AMI ID
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = 1
}
