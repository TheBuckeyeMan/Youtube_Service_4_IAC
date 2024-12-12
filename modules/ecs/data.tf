data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["youtube-vpc"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["Public Subnet *"] # Replace with your subnet tags or names
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

data "aws_security_group" "alb_sg" {
  filter {
    name   = "tag:Name"
    values = ["alb-sg"] # Replace with your ALB security group name or tag
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}