variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "region" {
    description = "Desired Region"
    type = string
    default = "us-east-2"
}

variable "input_bucket_name" {
  description = "S3 bucket for input files"
  type        = string
}

variable "output_bucket_name" {
  description = "S3 bucket for output files"
  type        = string
}
