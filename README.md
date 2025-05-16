# Terraform AWS Infrastructure

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS resources including EC2 instances, S3 buckets, and RDS databases.

## Quick Start

1. **Fork the Repository**:
   - Click the "Fork" button in the top right of this repository
   - This creates your own copy of the project

2. **Clone Your Fork**:
   ```bash
   # Replace YOUR_USERNAME with your GitHub username
   git clone https://github.com/YOUR_USERNAME/terraform-aws-infrastructure.git
   cd terraform-aws-infrastructure
   ```

3. **Configure AWS Credentials**:
   ```bash
   # Install AWS CLI if you haven't already
   brew install awscli  # for macOS
   
   # Configure AWS credentials
   aws configure
   # Enter your AWS Access Key ID
   # Enter your AWS Secret Access Key
   # Enter region (us-west-2)
   # Press Enter for default output format
   ```

4. **Create terraform.tfvars**:
   ```bash
   # Create a new file named terraform.tfvars
   cat > terraform.tfvars << EOL
   aws_region     = "us-west-2"
   bucket_name    = "your-unique-bucket-name"
   db_password    = "your-secure-password"
   EOL
   ```

5. **Initialize and Apply**:
   ```bash
   # Initialize Terraform
   terraform init
   
   # Plan the infrastructure
   terraform plan
   
   # Apply the configuration
   terraform apply
   ```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.5.0 or later)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- GitHub account for CI/CD

## GitHub Setup

1. **Configure Repository**:
   - Go to your forked repository settings
   - Under "General", ensure "Allow GitHub Actions" is enabled

2. **Configure Branch Protection**:
   - Go to Settings > Branches
   - Add rule for `main` branch
   - Enable:
     - Require pull request reviews
     - Require status checks to pass
     - Require branches to be up to date

3. **Set up GitHub Actions**:
   - Go to Settings > Actions > General
   - Enable "Allow GitHub Actions to create and approve pull requests"
   - Enable "Read and write permissions"

4. **Add Repository Secrets**:
   - Go to Settings > Secrets and variables > Actions
   - Add these secrets:
     ```
     AWS_ACCESS_KEY_ID: Your AWS access key
     AWS_SECRET_ACCESS_KEY: Your AWS secret key
     ```

## Development Workflow

1. **Create Feature Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**:
   - Modify Terraform configurations
   - Test locally with `terraform plan`

3. **Create Pull Request**:
   - Push your branch
   - Create PR on GitHub
   - GitHub Actions will:
     - Validate changes
     - Show plan
     - Comment on PR

4. **Merge to Main**:
   - After review and approval
   - GitHub Actions will automatically apply changes

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

## Troubleshooting

1. **GitHub Actions Failures**:
   - Check Actions tab for detailed logs
   - Verify AWS credentials are correct
   - Ensure branch protection rules are properly configured

2. **Terraform Errors**:
   - Run `terraform init` to ensure providers are up to date
   - Check AWS credentials are properly configured
   - Verify all required variables are set

## Common Issues

1. **AWS Credentials**:
   ```bash
   # Verify AWS credentials are working
   aws sts get-caller-identity
   ```

2. **Terraform State**:
   ```bash
   # If you get state errors, try
   terraform init -reconfigure
   ```

3. **GitHub Actions**:
   - If actions fail, check the Actions tab
   - Verify secrets are properly set
   - Check branch protection rules
