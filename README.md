# Terragrunt Sandbox
My sandbox repo for experimenting with Terragrunt


## How to use

### Create from a scaffold
```
mkdir -p local_files/test # replace <test>
cd $_
terragrunt scaffold ../../..//modules/create-local-file
```

You may edit the __locals.filename__ inside the *terragrunt.hcl* file

### Running terragrunt
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
