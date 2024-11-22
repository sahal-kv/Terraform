resource "aws_vpc" "main" {
  cidr_block              = var.vpc_cidr

  tags = {
    Name                  = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  cidr_block              = var.public_subnets[count.index]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name                  = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}
