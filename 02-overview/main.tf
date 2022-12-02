terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_eip" "awselasticip" {
  vpc = true
  }
resource "aws_eip_association" "awselasticip"{
  instance_id   = aws_instance.AmazonEC2.id
  allocation_id = aws_eip.awselasticip.id
}

resource "aws_instance" "AmazonEC2" {
  ami           = "ami-026b57f3c383c2eec" # Amazon EC2 // us-east-1
  instance_type = "t2.micro"
  key_name = "orange"
  security_groups = ["Linux-SG"]
  tags = {
    Name = "aws_ssm01"
  }
 }