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
  default     = "youtube-cluster"
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

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "LOGGING_BUCKET_NAME" {
  description = "Name of the logging bucket"
  type        = string
}

variable "LOGGING_BUCKET_KEY" {
  description = "Key for logging bucket"
  type        = string
}

variable "LANDING_BUCKET" {
  description = "Name of the landing bucket"
  type        = string
}

variable "AUDIO_BUCKET_KEY" {
  description = "Key for audio bucket"
  type        = string
}

variable "VIDEO_BUCKET_KEY" {
  description = "Key for video bucket"
  type        = string
}

variable "YOUTUBE_BUCKET_KEY" {
  description = "Key for YouTube bucket"
  type        = string
}

variable "container_image" {
  description = "ECR image URI for the container"
  type        = string
  default     = "339712758982.dkr.ecr.us-east-2.amazonaws.com/youtube-containers:youtube-service-4"
}