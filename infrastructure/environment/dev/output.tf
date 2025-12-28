output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_study_instance.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_study_instance.public_ip
}
