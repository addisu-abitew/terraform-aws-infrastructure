# Terraform AWS Infrastructure

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS resources including EC2 instances, S3 buckets, and RDS databases.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.5.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- GitHub account for CI/CD

## Setup

1. Install Terraform:
   ```bash
   # macOS
   brew install terraform
   ```

2. Configure AWS credentials:
   ```bash
   aws configure
   ```
   You'll need to provide:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region (use "us-west-2")
   - Default output format (press Enter for default "json")

3. Create a `terraform.tfvars` file locally (do not commit this file):
   ```hcl
   aws_region     = "us-west-2"
   bucket_name    = "your-unique-bucket-name"
   db_password    = "your-secure-password"
   ```

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Plan the infrastructure:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. To destroy the infrastructure:
   ```bash
   terraform destroy
   ```

## Resources Created

- EC2 Instance (t2.micro)
  - Amazon Linux 2 AMI
  - Public IP address available in outputs
- S3 Bucket
  - Custom bucket name
  - Basic configuration
- RDS MySQL Instance (db.t3.micro)
  - MySQL 5.7
  - 20GB storage
  - Endpoint available in outputs

## GitHub Actions Workflow

The project includes a GitHub Actions workflow that:
- Runs on push to main branch and pull requests
- Validates Terraform configuration
- Plans changes on pull requests
- Automatically applies changes when merged to main

## Security Best Practices

1. **Credentials Management**
   - Never commit AWS credentials to version control
   - Use AWS IAM roles with least privilege
   - Store sensitive values in AWS Secrets Manager

2. **State Management**
   - Use remote state storage (e.g., S3 + DynamoDB) in production
   - Enable state encryption
   - Use state locking

3. **Resource Security**
   - Enable encryption for S3 buckets
   - Use security groups for EC2 instances
   - Enable encryption for RDS instances
