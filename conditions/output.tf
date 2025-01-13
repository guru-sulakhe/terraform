output "public_ip" {
  value       = aws_instance.db.public_ip
}
# this will be displayed during $terraform apply -auto-approve
# output:
# public_ip = ""2.25.30.10"
