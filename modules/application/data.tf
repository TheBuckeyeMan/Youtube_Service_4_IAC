data "aws_ecs_cluster" "fargate_cluster" {
  cluster_name = var.cluster_name
}