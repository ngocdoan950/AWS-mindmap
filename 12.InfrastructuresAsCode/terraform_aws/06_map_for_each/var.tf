variable "user_names" {
  type = map(object({    //Định nghĩa kiểu map
    path = string,
    tags = map(string)
  }))
  default = {
    "Paul" = { 
      path = "/sales/"
      tags = {
        "email" = "paul@acme.com"
        "mobile" = "0902209011" 
      } 
    }
    "John" = { 
      path = "/marketing/"
      tags = { 
        "email" = "john@acme.com"
        "mobile" = "0902209012" } 
    }
  }
}