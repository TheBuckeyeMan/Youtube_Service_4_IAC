output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_service.id
}

output "api_gateway_security_group_id" {
  value = aws_security_group.api_gateway.id
}