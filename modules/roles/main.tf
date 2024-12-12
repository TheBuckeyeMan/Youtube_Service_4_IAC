resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_execution_assume_policy.json
}

data "aws_iam_policy_document" "ecs_execution_assume_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_policy.json
}

data "aws_iam_policy_document" "ecs_task_assume_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "ecs_task_s3_access" {
  name   = "ecs-task-s3-access"
  role   = aws_iam_role.ecs_task_role.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = [
          "arn:aws:s3:::landing-data-bucket-1220-16492640/*",
          "arn:aws:s3:::logging-event-driven-bucket-1220-16492640/*"
        ]
      }
    ]
  })
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/youtube-service-4" # Ensure this matches the expected name
  retention_in_days = 7                        # Adjust retention as needed

  tags = {
    Name = "ECS Log Group"
  }
}