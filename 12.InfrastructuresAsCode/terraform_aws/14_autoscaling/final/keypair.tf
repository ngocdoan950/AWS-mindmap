resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.keyname
  public_key = "${tls_private_key.pk.public_key_openssh}"

  provisioner "local-exec" { # Create keypair to your computer!!
    command = <<EOT
              rm -f ./${var.keyname}.pem
              echo '${tls_private_key.pk.private_key_pem}' > ./${var.keyname}.pem
              chmod 400 ${var.keyname}.pem
              EOT
  }
}