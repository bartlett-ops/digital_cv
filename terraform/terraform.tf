terraform {
  backend "s3" {
    bucket         = "bartlett-remote-states"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "digital-cv/terraform.tfstate"
    profile        = "bartlett"
    region         = "eu-west-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}
