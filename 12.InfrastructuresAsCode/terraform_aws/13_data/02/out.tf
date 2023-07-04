output "default_vpc_cidr_block" {
 value = data.aws_vpc.default.cidr_block
}

output "aws_subnets" {
 value = data.aws_subnets.default
}

output "aws_subnet" {
 value = data.aws_subnet.default
}