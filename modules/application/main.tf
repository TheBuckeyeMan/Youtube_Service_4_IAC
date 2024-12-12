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
        { name = "LOGGING_BUCKET_NAME", value = var.LOGGING_BUCKET_NAME },
        { name = "LOGGING_BUCKET_KEY", value = var.LOGGING_BUCKET_KEY },
        { name = "LANDING_BUCKET", value = var.LANDING_BUCKET },
        { name = "AUDIO_BUCKET_KEY", value = var.AUDIO_BUCKET_KEY },
        { name = "VIDEO_BUCKET_KEY", value = var.VIDEO_BUCKET_KEY },
        { name = "YOUTUBE_BUCKET_KEY", value = var.YOUTUBE_BUCKET_KEY },
        { name = "AWS_REGION", value = var.AWS_REGION }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group
          awslogs-region        = var.AWS_REGION
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