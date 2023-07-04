resource "aws_launch_configuration" "example" {
  image_id      = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.id]
  key_name      = "${aws_key_pair.generated_key.key_name}"
  
  user_data = file("script.sh")
  lifecycle {
    create_before_destroy = true
  }
}