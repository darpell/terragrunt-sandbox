include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  version  = "0.0.1"
  filename = "./test.txt"
  content  = "Hello from shared, Terragrunt! This is version ${local.version}. ${include.root.locals.addtl_content}"
}

inputs = {
  filename = local.filename
  content  = local.content
}