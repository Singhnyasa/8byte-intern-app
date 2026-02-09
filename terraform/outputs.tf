output "vpc_id" {
    value = aws_vpc.main.id
    description = "The ID of created vpc"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.id
  description = "List of public subnet IDs"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "Internet Gateway ID"
}
output "public_route_table_id" {
  value       = aws_route_table.public_rt.id
  description = "Public route table ID"
}
output "security_group_id" {
  value       = aws_security_group.app_sg.id
  description = "Security group ID for EC2 instances"
}

output "ec2_instance_id" {
value = aws_instance.app_server.id
description = "EC2 instnce ID"
}