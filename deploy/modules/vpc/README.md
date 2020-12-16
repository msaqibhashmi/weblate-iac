# AWS VPC Setup 
> Terraform & AWS
> Infra as code for creating & managing aws vpc (Atom subnetting scheme is followed)

## Requirements
Terraform 0.12
AWS ACCESS KEY
AWS ACCESS SECRET

## Installation

Linux:

1) Sample usage for Terraform project
```
provider "aws" {
  version = "~> 2.32.0"
  region = "us-west-1"
}

module "vpc" {
  source = "/root/iac-modules/vpc"

  cidr_vpc = "10.220.0.0/16"

  availability_zones = ["us-west-1a", "us-west-1c"] 
  public_subnet_cidrs = ["10.220.0.0/20","10.220.16.0/20"]
  public_subnet_names = ["pub-subnet-a","pub-subnet-c"]

  VPC_Name = "220-prod-vpc"
  RT_Name = "rt-prod-vpc"
  IGW_Name = "igw-prod-vpc"

  Application = "VPC"
  Environment = "Production"
  Team = "Devops"
  Project = "Atom"
}
```

2) Validate & Deploy VPC
```
terraform validate
terraform apply
```

## Developer
Saqib Hashmi [m.saqibhashmi@gmail.com]

