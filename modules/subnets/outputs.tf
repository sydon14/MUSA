output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [
    aws_subnet.dmz_subnet_ue1a.id,
    aws_subnet.mgn_subnet_ue1a.id,
    aws_subnet.dmz_subnet_ue1b.id
  ]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [
    aws_subnet.app_subnet_ue1a.id,
    aws_subnet.app_subnet_ue1b.id,  
    aws_subnet.data_subnet_ue1a.id,
    aws_subnet.data_subnet_ue1b.id,
    aws_subnet.subnet_ue1a_tgwa.id, 
    aws_subnet.subnet_ue1b_tgwa.id  
  ]
}
