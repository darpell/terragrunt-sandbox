# Terragrunt Sandbox
My sandbox repo for experimenting with Terragrunt


## How to use
1. Open a terminal execute the following

```bash
cd infra/local_files
terragrunt run-all apply --terragrunt-non-interactive
```

2. Notice that there are files made in each directory that is based on the individual _terragrunt.hcl_ file inside the child directory.
These text files should contain the value of __content__ set in _infra/local_files/shared.hcl_


3. When you are done, cleanup the repo by running
```bash
terragrunt run-all destroy --terragrunt-non-interactive
```


[![Watch the demo](./demo.mov)](./demo.mov)
