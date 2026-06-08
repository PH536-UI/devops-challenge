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
resource "aws_s3_bucket" "artifact_store" {
  bucket = "devops-codeartifact-store"
}
resource "aws_iam_role" "ec2_role" {
  name = "ec2-artifact-role"
  assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}]}"
}
resource "aws_iam_instance_profile" "profile" {
  name = "ec2-artifact-profile"
  role = aws_iam_role.ec2_role.name
}
output "bucket" { value = aws_s3_bucket.artifact_store.bucket }
output "role"   { value = aws_iam_role.ec2_role.name }
