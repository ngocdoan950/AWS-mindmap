data "aws_eip" "by_allocation_id" {
  id = var.eip_id
}