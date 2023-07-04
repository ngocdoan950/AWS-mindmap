resource "aws_security_group" "app_secgroup" {
  name   = "app_secgroup"
}

resource "aws_security_group_rule" "ingress_rules" {
  count       = length(var.ports)  //Cần phải có biến đếm count để duyệt qua từng phần tử
  type        = "ingress"
  from_port   = var.ports[count.index].port
  to_port     = var.ports[count.index].port
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = var.ports[count.index].description
  security_group_id = aws_security_group.app_secgroup.id
}

//Demo cú pháp [for ... in : ]
output "ingress_rules_simple" {
  value = [for i, v in aws_security_group_rule.ingress_rules : {desc = v.description, port = v.from_port}]
}