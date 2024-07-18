terraform {
  required_providers { # providers helps in that we are using aws in the terraform, thus providers are essential in terraform
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

# provide authentication here
provider "aws" {
  region = "us-east-1"
}