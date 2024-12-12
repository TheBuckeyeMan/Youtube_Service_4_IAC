output "cluster_arn" {
  value = aws_ecs_cluster.fargate_cluster.arn
}

# output "alb_arn" {
#   value = aws_lb.ecs_alb.arn
# }

# output "alb_target_group_arn" {
#   value = aws_lb_target_group.ecs_target_group.arn
# }