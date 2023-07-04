output "availability_zones" {
 value = data.aws_availability_zones.available.names
}

output "running_instances" {
 value = data.aws_instances.running_instances.ids
}

output "amazon_ami" {
 value = {
  name = data.aws_ami.amazon-linux.name
  id = data.aws_ami.amazon-linux.id
  desc = data.aws_ami.amazon-linux.description
 }
}