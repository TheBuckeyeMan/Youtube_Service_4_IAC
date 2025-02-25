resource "aws_ecs_task_definition" "youtube_service_4" {
  family                   = var.family_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn = data.aws_iam_role.ecs_execution_role.arn
  task_role_arn = data.aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "youtube-service-4"
      image     = var.container_image
      memory    = var.memory
      cpu       = var.cpu
      essential = true
      environment = [
        { name = "LOGGING_BUCKET_NAME", value = var.LOGGING_BUCKET_NAME },
        { name = "LOGGING_BUCKET_KEY", value = var.LOGGING_BUCKET_KEY },
        { name = "LANDING_BUCKET", value = var.LANDING_BUCKET },
        { name = "AUDIO_BUCKET_KEY", value = var.AUDIO_BUCKET_KEY },
        { name = "VIDEO_BUCKET_KEY", value = var.VIDEO_BUCKET_KEY },
        { name = "YOUTUBE_BUCKET_KEY", value = var.YOUTUBE_BUCKET_KEY },
        { name = "SPEECH_BUCKET_KEY", value = var.SPEECH_BUCKET_KEY },
        { name = "AWS_REGION", value = var.region }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group = data.aws_cloudwatch_log_group.ecs_log_group.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "youtube-service-4"
        }
      }
    }
  ])
}

#Below is an always active ecs service - DO NOT USE for Event driven, batch jobs, or smaller tasks as this makes your app ALWAYS ACTIVE: Min cost of this is 10$ Per Month(No Traffic)
# resource "aws_ecs_service" "app_service" {
#   name            = var.service_name
#   cluster = data.aws_ecs_cluster.fargate_cluster.id
#   task_definition = aws_ecs_task_definition.youtube_service_4.arn
#   desired_count   = var.desired_count
#   launch_type     = "FARGATE"

#   network_configuration {
#     subnets = data.aws_subnets.public_subnets.ids
#     security_groups = [data.aws_security_group.ecs_service.id]
#     assign_public_ip = false
#   }
#   deployment_controller {
#     type = "ECS"
#   }

#   tags = {
#     Name        = var.service_name
#     Environment = "Production"
#   }
# }