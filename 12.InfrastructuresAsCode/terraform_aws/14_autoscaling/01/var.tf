variable "server_port" {
  description = "Server Port"
  type        = number
  default     = 80
}

variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "demokey"
}