locals {
  version = "0.0.2" # Currently unused
  filename = "./test.txt" # Just testing that this will be overwritten
  content = "Hello from shared, Terragrunt! This is version ${local.version}"
}

inputs = {
  filename  = local.filename
  content  = local.content
}