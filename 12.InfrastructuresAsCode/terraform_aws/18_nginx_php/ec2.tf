resource "aws_instance" "web" {
  ami             = "ami-0ff89c4ce7de192ea"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = ["web_ssh"]
  user_data = file("script.sh")
  tags = {
    Name = "nginxphp"
  }

  //Copy folder travel vào thư mục /home/ec2-user/
  provisioner "file" {
    source      = "./phpsite"
    destination = "/home/ec2-user"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
  provisioner "file" {
    source      = "./phpsite.conf"
    destination = "/home/ec2-user/phpsite.conf"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}