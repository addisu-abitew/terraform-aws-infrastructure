terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-example"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name = "terraform-example-bucket"
  }
}

# RDS Instance
resource "aws_db_instance" "example" {
  identifier           = "terraform-example-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = var.db_instance_class
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true

  tags = {
    Name = "terraform-example-db"
  }
} 