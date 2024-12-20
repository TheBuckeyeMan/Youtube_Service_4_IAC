data "aws_ecs_cluster" "fargate_cluster" {
  cluster_name = var.cluster_name
}

data "aws_cloudwatch_log_group" "ecs_log_group" {
  name = "/ecs/youtube-service-4"
}

data "aws_iam_role" "ecs_execution_role" {
  name = "ecs-task-execution-role"
}

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = ["youtube-vpc"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public Subnet *"] # Replace with your subnet tag pattern
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main_vpc.id]
  }
}

data "aws_iam_role" "ecs_task_role" {
  name = "ecs-task-role"
}

data "aws_security_group" "ecs_service" {
  filter {
    name   = "tag:Name"
    values = ["ECS Service Security Group"]
  }
}
