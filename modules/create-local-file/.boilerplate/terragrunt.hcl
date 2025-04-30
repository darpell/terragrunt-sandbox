include "root" {
  path = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../../modules/create-local-file" # hard coded relative path
}

locals {
  shared_vars = read_terragrunt_config(find_in_parent_folders("shared.hcl"))  
  version = local.shared_vars.locals.version
  filename = local.shared_vars.locals.filename
}

inputs = merge(local.shared_vars.inputs, {
  filename = "${get_terragrunt_dir()}/${local.filename}"
})