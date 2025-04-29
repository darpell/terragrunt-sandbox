

# Base Terragrunt Makefile
#
# To minimise duplication, and enforce consistancy, a base Makefile is provided here.
# Each module should contain its own makefile that extends this one, allowing for module-level functionality that is maintained in a central place.
#

# Environment variables
SHELL=/bin/bash
.DEFAULT_GOAL=help
PLAN_FILE ?= terragrunt.plan
LOCK_TIMEOUT ?= 120s
RUN_ALL ?= true

PARALLELISM ?= 20

ifeq ($(RUN_ALL),true)
	TG_COMMAND := terragrunt run-all
else
	TG_COMMAND := terragrunt
endif

# Additional CLI Arguments
ifeq ($(GITHUB_ACTIONS),true)
	TF_INPUT := 0
	TF_IN_AUTOMATION := 1
	# Arguments to use when running in GitHub Actions
	APPLY_ARGS := -lock-timeout=$(LOCK_TIMEOUT) -parallelism $(PARALLELISM) --terragrunt-no-auto-init --terragrunt-ignore-external-dependencies
	DESTROY_ARGS := -lock-timeout=$(LOCK_TIMEOUT) -parallelism $(PARALLELISM) --terragrunt-no-auto-init --terragrunt-ignore-external-dependencies -auto-approve
	EXTRA_ARGS := -no-color --terragrunt-non-interactive
	FMT_ARGS := --terragrunt-check
	PLAN_ARGS := -lock-timeout=$(LOCK_TIMEOUT) -parallelism $(PARALLELISM) --terragrunt-no-auto-init --terragrunt-ignore-external-dependencies
else
	# Arguments to use when running locally
	INIT_ARGS := -backend=false
	# EXTRA_ARGS := -no-color
endif

.PHONY: help
help:
	@grep -E \
		'^.PHONY: .*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ".PHONY: |## "}; {printf "\033[36m%-16s\033[0m %s\n", $$2, $$3}'

.PHONY: clean ## Cleans the module of Terragrunt state - useful for local development
clean:
	@find . -d -name .terragrunt-cache -print0 | xargs -0 -I {} rm -rf "{}"

.PHONY: fmt ## Recursively check the format of the Terragrunt configuration files
fmt:
	@terragrunt hclfmt $(FMT_ARGS) $(EXTRA_ARGS)

.PHONY: init ## Initialize the working directory containing Terragrunt configuration files
init:
	@$(TG_COMMAND) init $(INIT_ARGS) $(EXTRA_ARGS)

.PHONY: plan ## Prepares an execution plan based on the Terragrunt configuration files
plan:
	@$(TG_COMMAND) plan -out $(PLAN_FILE) $(PLAN_ARGS) $(EXTRA_ARGS)

.PHONY: apply ## Executes the actions proposed in a Terragrunt execution plan
apply:
	@$(TG_COMMAND) apply $(APPLY_ARGS) $(EXTRA_ARGS) $(PLAN_FILE)

.PHONY: plan-destroy ## Plans the terragrunt destroy command
plan-destroy:
	@$(TG_COMMAND) plan -lock=false -destroy $(PLAN_ARGS) $(EXTRA_ARGS)

.PHONY: destroy ## Executes terragrunt destroy command
destroy:
	@$(TG_COMMAND) destroy -lock=false $(DESTROY_ARGS) $(EXTRA_ARGS)
