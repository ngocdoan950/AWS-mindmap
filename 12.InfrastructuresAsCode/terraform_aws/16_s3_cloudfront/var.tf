variable "website_root" {
  type        = string
  description = "Path to the root of website content"
  default     = "./movie"
}

variable "domain" {
  type        = string
  description = "Domain of web site"
  default     = "awshardway.click"
}