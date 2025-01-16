provider "aws" {
  region = var.region
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Security group for EC2 instance"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 32885
    to_port     = 32885
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Existing SSH rule for specific IP range
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["50.76.71.0/28"]
  }

  # New SSH rules for the provided IP addresses
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["150.195.204.2/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["150.195.204.173/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["149.20.198.179/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = "r6a.large"
  subnet_id     = var.subnet_id
  key_name      = var.keypair_name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 200
    delete_on_termination = true
  }

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Dev EC2 Instance"
  }
}
