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

variable "family_name" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "youtube-job-verification-family"
}

variable "service_name" {
  description = "ECS service name"
  type        = string
  default     = "youtube-job-verification-service"
}

variable "cpu" {
  description = "CPU units for Fargate tasks"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for Fargate tasks"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "logging_bucket_name" {
  description = "Name of the logging bucket"
  type        = string
}

variable "logging_bucket_key" {
  description = "Key for logging bucket"
  type        = string
}

variable "landing_bucket" {
  description = "Name of the landing bucket"
  type        = string
}

variable "audio_bucket_key" {
  description = "Key for audio bucket"
  type        = string
}

variable "video_bucket_key" {
  description = "Key for video bucket"
  type        = string
}

variable "youtube_bucket_key" {
  description = "Key for YouTube bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}



variable "container_image" {
  description = "ECR image URI for the container"
  type        = string
  default     = "339712758982.dkr.ecr.us-east-2.amazonaws.com/youtube-containers:youtube-service-4"
}

variable "log_group" {
  description = "The name of the CloudWatch Log Group for ECS tasks"
  type        = string
}