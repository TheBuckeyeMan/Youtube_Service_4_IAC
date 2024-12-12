resource "aws_ecs_task_definition" "youtube_service_4" {
  family                   = var.family_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "youtube-service-4"
      image     = var.container_image
      memory    = var.memory
      cpu       = var.cpu
      essential = true
      environment = [
        { name = "LOGGING_BUCKET_NAME", value = var.logging_bucket_name },
        { name = "LOGGING_BUCKET_KEY", value = var.logging_bucket_key },
        { name = "LANDING_BUCKET", value = var.landing_bucket },
        { name = "AUDIO_BUCKET_KEY", value = var.audio_bucket_key },
        { name = "VIDEO_BUCKET_KEY", value = var.video_bucket_key },
        { name = "YOUTUBE_BUCKET_KEY", value = var.youtube_bucket_key },
        { name = "AWS_REGION", value = var.aws_region }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "youtube-service-4"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "app_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.fargate_cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [aws_security_group.ecs_service.id]
    assign_public_ip = false
  }
}