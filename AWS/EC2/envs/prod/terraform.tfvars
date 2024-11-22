aws_region      = "us-east-1"
key_name        = "My-Key"
ami_id          = "ami-0866a3c8686eaeeba" # Ubuntu 24.04
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_name        = "Terraform-VPC"
instance_name   = "Terraform-EC2"
