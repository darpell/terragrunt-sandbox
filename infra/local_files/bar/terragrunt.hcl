terraform {
  source = "/Users/dpelonia/dev/sandbox/tf/tg/modules/create-local-file"
}

locals {
  shared_vars = read_terragrunt_config(("../shared.hcl"))
}


inputs = merge(local.shared_vars.inputs, {
  # content = "Hello from bar2, Terragrunt!"
  filename = "${get_terragrunt_dir()}/bar.txt"
})