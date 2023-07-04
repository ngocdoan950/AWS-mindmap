variable "ports" {
  type = list(object({
    port   = number
    description = string
  }))
  default = [
    {
      port        = 22
      description = "SSH"
    },
    {
      port        = 80
      description = "HTTP"
    },
    {
      port        = 3306
      description = "MySQL"
    },
    {
      port        = 5432
      description = "Postgresql"
    },
    {
      port        = 6379
      description = "Redis"
    }
  ]
}
