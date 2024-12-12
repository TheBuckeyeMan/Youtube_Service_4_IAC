resource "aws_api_gateway_vpc_link" "ecs_vpc_link" {
  name        = "ecs-vpc-link"
  target_arns = [aws_alb_target_group.ecs_target_group.arn]
}

resource "aws_apigatewayv2_api" "ecs_api" {
  name          = "youtube-job-verification-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "ecs_integration" {
  api_id             = aws_apigatewayv2_api.ecs_api.id
  integration_type   = "HTTP_PROXY"
  integration_uri    = aws_alb_target_group.ecs_target_group.arn
  connection_type    = "VPC_LINK"
  connection_id      = aws_api_gateway_vpc_link.ecs_vpc_link.id
}

resource "aws_apigatewayv2_route" "ecs_route" {
  api_id    = aws_apigatewayv2_api.ecs_api.id
  route_key = "POST /process"
  target    = "integrations/${aws_apigatewayv2_integration.ecs_integration.id}"
}

resource "aws_apigatewayv2_stage" "ecs_stage" {
  api_id      = aws_apigatewayv2_api.ecs_api.id
  name        = "prod"
  auto_deploy = true
}