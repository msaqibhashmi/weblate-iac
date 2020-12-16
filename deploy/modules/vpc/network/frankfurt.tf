provider "aws" {
  version = "~> 2.32.0"
  region  = "eu-central-1"
}

module "vpc" {
  source = "../../vpc"

  cidr_vpc = "10.230.0.0/16"

  availability_zones  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnet_cidrs = ["10.230.0.0/20", "10.230.16.0/20", "10.230.32.0/20"]
  public_subnet_names = ["pub-subnet-a", "pub-subnet-b", "pub-subnet-c"]

  VPC_Name    = "230-prod-vpc"
  RT_Name     = "rt-prod-vpc"
  IGW_Name    = "igw-prod-vpc"
  Application = "VPC"
  Environment = "Production"
  Team        = "Devops"
  Project     = "Atom"
}
