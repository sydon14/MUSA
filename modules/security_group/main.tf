resource "aws_security_group" "app_sg" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id
  description = "Security group for app subnets"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Temporary; replace with trusted CIDRs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
