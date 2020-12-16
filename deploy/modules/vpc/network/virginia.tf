provider "aws" {
  version = "~> 2.32.0"
  region  = "us-east-1"
}

module "vpc" {
  source = "../../vpc"

  cidr_vpc = "10.240.0.0/16"

  availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  public_subnet_cidrs = ["10.240.0.0/20", "10.240.16.0/20", "10.240.32.0/20", "10.248.0.0/20", "10.264.16.0/20", "10.280.32.0/20"]
  public_subnet_names = ["pub-subnet-a", "pub-subnet-b", "pub-subnet-c", "pub-subnet-d", "pub-subnet-e", "pub-subnet-f"]

  VPC_Name    = "240-prod-vpc"
  RT_Name     = "rt-prod-vpc"
  IGW_Name    = "igw-prod-vpc"
  Application = "VPC"
  Environment = "Production"
  Team        = "Devops"
  Project     = "Atom"
}
