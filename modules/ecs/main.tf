resource "aws_ecs_cluster" "fargate_cluster" {
  name = var.cluster_name
}