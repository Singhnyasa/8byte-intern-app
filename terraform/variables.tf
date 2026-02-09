variable  "aws_region"{
  description = "AWS region to deploy resources"
  type = string
}

variable "environment_name" {
  description = "Environment name used in resource names and tags"
  type = string
 
}

variable "vpc_cidr" {
    description = "CIDR blcok for that VPC"
    type = string   
}

variable "tags" {
   description = "Global tags to apply to all resources"
   type = map(string)
   default = {
     Terraform = "true"
   }
}

variable "ami_id" {
  description = "ami_id"
  type = string
}

variable "instance_type" {
  description = "Instance type of ubuntu"
  type = string
}