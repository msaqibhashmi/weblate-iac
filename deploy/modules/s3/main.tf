resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  versioning {
    enabled    = lookup(var.versioning, "enabled", true)
    mfa_delete = lookup(var.versioning, "mfa_delete", false)
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = var.Name
    Application = var.Application
    Environment = var.Environment
    Team        = var.Team
    Project     = var.Project
  }
}

