variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "keyname" {
  default     = "mern-"
  description = "Name of AWS key pair"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}