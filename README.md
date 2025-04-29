# Terragrunt Sandbox
My sandbox repo for experimenting with Terragrunt


## How to use
1. Open a terminal execute the following

```bash
cd infra
make plan && make apply
```

2. Notice that there are files made in each directory that is based on the individual _terragrunt.hcl_ file inside the child directory.
These text files should contain the value of __content__ set in _infra/local_files/shared.hcl_


3. When you are done, cleanup the repo by running
```bash

make plan-destroy && make destroy
```

## Watch the demo



[Watch Demo](https://github.com/user-attachments/assets/d6bdce6d-28d3-43de-8862-6cf63bf31744)

