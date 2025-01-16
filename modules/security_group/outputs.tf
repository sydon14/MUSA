output "app_sg_id" {
  description = "ID of the application security group"
  value       = aws_security_group.app_sg.id
}
