terraform {
  source = "../../../modules/create-local-file"
}

locals {
  shared_vars = read_terragrunt_config(find_in_parent_folders("shared.hcl")) 
  version = local.shared_vars.locals.version
}

inputs = merge(local.shared_vars.inputs, {
  filename = "${get_terragrunt_dir()}/bar.txt"  # notice that it is different from the shared.hcl
})