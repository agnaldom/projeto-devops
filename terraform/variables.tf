# Provider variable
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "aws_region" {
        description   = "AWS region on which we will setup the swmar cluster"
}

# Network variable
variable "vpc_cidr" {}
variable "availability_zone" {}
variable "cidr_block_public" {}
variable "cidr_block_private" {}