locals {
  version = "0.0.1"
  filename = "./test.txt"
  content = "Hello from shared2, Terragrunt!"
}

inputs = {
  filename  = local.filename
  content  = local.content
}