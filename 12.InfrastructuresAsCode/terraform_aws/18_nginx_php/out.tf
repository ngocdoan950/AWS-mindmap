//Chuyển tất cả output variable vào đây
output "ssh_command" {
  value = "ssh -i '${var.keyname}.pem' ec2-user@${data.aws_eip.by_allocation_id.public_ip}"
}

output "web_site" {
  value = "http://${data.aws_eip.by_allocation_id.public_ip}"
}