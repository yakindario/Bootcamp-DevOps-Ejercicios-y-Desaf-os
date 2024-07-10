output "ip_instancia" {
  value = aws_instance.web.public_ip
}

output "id_instancia" {
  value = aws_instance.web.id
}

output "ip_privada" {
  value = aws_instance.web.private_ip
}
