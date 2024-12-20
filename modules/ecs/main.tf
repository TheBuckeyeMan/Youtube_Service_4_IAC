resource "aws_ecs_cluster" "fargate_cluster" {
  name = var.cluster_name
}

#This is an AWS Load Balencer: May be needed for Large apps. Uncomment to enable. Costs 16$ per month(Not Required for On Demand ECS Clusters)
# resource "aws_lb" "ecs_alb" {
#   name               = "ecs-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [data.aws_security_group.alb_sg.id]
#   subnets            = data.aws_subnets.public_subnets.ids

#   tags = {
#     Name = "ecs-alb"
#   }
# }

#This is part of the AWS Load Balencer: May be needed for Large apps. Uncomment to enable. Costs 16$ per month(Not Required for On Demand ECS Clusters)
# resource "aws_lb_target_group" "ecs_target_group" {
#   name        = "ecs-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = data.aws_vpc.main.id

#   health_check {
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     matcher             = "200"
#     path                = "/"
#     protocol            = "HTTP"
#   }

#   tags = {
#     Name = "ecs-target-group"
#   }
# }

#This is part of the AWS Load Balencer: May be needed for Large apps. Uncomment to enable. Costs 16$ per month(Not Required for On Demand ECS Clusters)
# resource "aws_lb_listener" "ecs_listener" {
#   load_balancer_arn = aws_lb.ecs_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_target_group.arn
#   }
# }