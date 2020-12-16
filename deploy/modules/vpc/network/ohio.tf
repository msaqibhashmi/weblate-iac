provider "aws" {
  version = "~> 2.32.0"
  region  = "us-east-2"
}

module "vpc" {
  source = "../../vpc"

  cidr_vpc = "10.250.0.0/16"

  availability_zones  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnet_cidrs = ["10.250.0.0/20", "10.250.16.0/20", "10.250.32.0/20"]
  public_subnet_names = ["pub-subnet-a", "pub-subnet-b", "pub-subnet-c"]

  VPC_Name    = "250-prod-vpc"
  RT_Name     = "rt-prod-vpc"
  IGW_Name    = "igw-prod-vpc"
  Application = "VPC"
  Environment = "Production"
  Team        = "Devops"
  Project     = "Atom"
}

