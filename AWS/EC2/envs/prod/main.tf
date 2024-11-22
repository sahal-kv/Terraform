module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  vpc_name       = var.vpc_name
}

module "ec2" {
  source         = "../../modules/ec2"
  instance_name  = var.instance_name
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  subnet_id      = module.vpc.public_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
  depends_on     = [ module.vpc ]
}
