terraform {
  backend "s3" {
    bucket         = "my-s3-bucket-name"
    key            = "prod/terraform.tfstate"  
    region         = "us-east-1"               
    encrypt        = true                     
  }
}
