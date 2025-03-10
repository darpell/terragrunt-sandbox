locals {
  version = "0.0.1"
  filename = "./test.txt"
  content = "Hello from shared, Terragrunt!"
}

inputs = {
  filename  = local.filename
  content  = local.content
}