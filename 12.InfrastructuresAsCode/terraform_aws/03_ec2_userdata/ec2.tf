resource "aws_instance" "app_server" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.open_8080.id]
  
  //Cú pháp HereDoc để viết multiline
  user_data = <<EOF
              #!/bin/bash
              echo "Hello World" > index.html
              sudo python3 -m http.server 8080 &
              EOF

  tags = {
    Name = "PythonWebServer"
  }
}