variable "bucket_name" {
  type = string
}

variable "versioning" {
  type = map
  default = {
    enabled    = true
    mfa_delete = false
  }
}

variable "Name" {
  type = string
}

variable "Application" {
  type = string
}

variable "Environment" {
  type = string
}

variable "Team" {
  type = string
}

variable "Project" {
  type = string
}
