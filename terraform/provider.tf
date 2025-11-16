terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket         = "YOUR-TF-STATE-BUCKET"
    key            = "cloud-native-cicd/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "YOUR-TF-LOCK-TABLE"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
