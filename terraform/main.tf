resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cicd-vpc"
  }
}

# ...subnets, IAM, EKS module etc. (to be expanded)
