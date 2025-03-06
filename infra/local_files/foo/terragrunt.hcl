terraform {
  source = "/Users/dpelonia/dev/sandbox/tf/tg/modules/create-local-file"
}

locals {
  shared_vars = read_terragrunt_config(find_in_parent_folders("/shared.hcl"))  
}

inputs = merge(local.shared_vars.inputs, {
  # content = "Hello from foo2, Terragrunt!"
  filename = "${get_terragrunt_dir()}/foo.txt"
})