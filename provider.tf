data "aws_region" "current" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket  = "pipeline-artifacts-casestudy-cicd"
    encrypt = true
    key     = "state/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    
  }
}

provider "aws" {
    region = "us-east-1"
}