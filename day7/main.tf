terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

resource "aws_s3_bucket" "pipeline_store" {
  bucket = "devops-pipeline-store"
  tags   = { Name = "pipeline-store", Day = "7" }
}

resource "aws_iam_role" "pipeline_role" {
  name = "codepipeline-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "codepipeline.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "pipeline_policy" {
  name = "codepipeline-policy"
  role = aws_iam_role.pipeline_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:*", "codebuild:*", "codedeploy:*", "iam:PassRole"]
      Resource = "*"
    }]
  })
}

output "pipeline_bucket" { value = aws_s3_bucket.pipeline_store.bucket }
output "pipeline_role"   { value = aws_iam_role.pipeline_role.name }
