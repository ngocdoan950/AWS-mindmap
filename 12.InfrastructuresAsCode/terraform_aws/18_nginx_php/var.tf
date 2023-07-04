variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "demokey"
}

variable "eip_id" {
  description = "AllocationID of Elastic IP, will associate to EC2"
  type        = string
  default     = "eipalloc-0bc994487b3a50579"
}