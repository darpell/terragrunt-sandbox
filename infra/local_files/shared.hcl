locals {
  version = "0.0.1" # Currently unused
  filename = "./test.txt" # Just testing that this will be overwritten
  content = "Hello from shared, Terragrunt!"
}

inputs = {
  filename  = local.filename
  content  = local.content
}