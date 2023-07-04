locals {
  //Nạp danh sách mime type từ file mime.json
  mime_types = jsondecode(file("mime.json"))
}