output "instance_id" {
    description = "ID of the instance"
    value       =  aws_instance.app_study_instance.id

}

output "instance_public_ip" {
    description = "display public ip of the instance"
    value       = aws_instance.app_study_instance.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.pk.private_key_pem
  sensitive = true
}