#resources
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = var.VPC_Name
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = "true"
  tags = {
    Name        = var.public_subnet_names[count.index]
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = var.IGW_Name
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = var.RT_Name
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.subnet_public.*.id, count.index)
  route_table_id = aws_route_table.rtb_public.id
}

