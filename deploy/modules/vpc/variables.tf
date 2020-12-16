# Resources
variable "cidr_vpc" {
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "public_subnet_names" {
  type = list(string)
}

# Tags
variable "VPC_Name" {
}

variable "RT_Name" {
}

variable "IGW_Name" {
}

variable "Application" {
}

variable "Environment" {
}

variable "Team" {
}

variable "Project" {
}

