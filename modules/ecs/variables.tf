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

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
  default     = "youtube-job-verification-cluster"
}