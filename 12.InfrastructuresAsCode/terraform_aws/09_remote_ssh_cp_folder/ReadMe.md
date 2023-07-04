Bài này sẽ dựng một EC2, cài nginx sau đó copy thư mục travel để hosting

## Những thay đổi so với bài 09_remote_ssh:

1. Các file *.tf được chia nhỏ đến từng chức năng cụ thể. Chỉ cần nhìn tên file là biết nhiệm vụ.
2. Bổ xung lệnh copy folder từ local vào EC2
```hcl
resource "aws_instance" "web" {
  ami             = "ami-0ff89c4ce7de192ea"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = ["ingress_rules"]
  tags = {
    Name = "phpserver"
  }

  //Copy folder travel vào thư mục /home/ec2-user/
  provisioner "file" {
    source      = "./travel"
    destination = "/home/ec2-user/"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}
```

3. Trong file remote.tf sử dụng lệnh Linux sed để thay thế chuỗi `/usr/share/nginx/html` bằng `/usr/share/nginx/html/travel`

## Kết quả khi chạy
```
Outputs:
ssh_command = "ssh -i 'demokey.pem' ec2-user@13.212.92.39"
web_site = "http://13.212.92.39"
```

Web site hiện ra
![demo](demo.png)