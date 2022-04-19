region                      ?= eu-central-1
AWS_ACCOUNT_NUMBER          := $(shell aws sts get-caller-identity --query Account --output text)
AWS_DEFAULT_REGION          ?= $(region)

tfstate_s3_bucket = ana-cg-mtx-aws-state-files
tfstate_dynamodb_table = cg-mtx-aws-state-files

ifndef env 
$(error Environment variable 'env' not set)
endif

ifndef layer 
$(error Environment variable 'layer' not set)
endif

ifdef OS
	#Windows stuff
	RM = rmdir .terraform\ /S /Q
	DEF = set
else
	#Linux stuff
	ifeq ($(shell uname), Linux)
		RM = rm -rf .terraform/
		DEF = export
	else
		DEF = export
	endif
endif

fmt:
	cd layers && terraform fmt -recursive
	cd modules && terraform fmt -recursive

init:
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	terraform -chdir=../../layers/$(layer)/ init -upgrade -backend=true \
		-backend-config="bucket=$(tfstate_s3_bucket)" \
		-backend-config="dynamodb_table=$(tfstate_dynamodb_table)" \
		-backend-config="key=$(account)/$(layer)/terraform.tfstate" \
		-backend-config="region=$(region)" \

validate:
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	terraform -chdir=../../layers/$(layer)/ validate ../../layers/$(layer)/

plan: validate
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	$(DEF) TF_VAR_env=$(env) && \
	terraform -chdir=../../layers/$(layer)/ plan -out ../../plan_files/tf_plan_$(layer).plan

apply:
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	$(DEF) TF_VAR_env=$(env) && \
	terraform -chdir=../../layers/$(layer)/ apply ../../plan_files/tf_plan_$(layer).plan

plan-destroy:
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	$(DEF) TF_VAR_env=$(env) && \
	terraform -chdir=../../layers/$(layer)/ plan -destroy -out ../../plan_files/tf_plan_destroy_$(layer).plan  

destroy:
	cd environments/$(env) && \
	$(DEF) TF_DATA_DIR=../../environments/$(env)/.terraform&& \
	$(DEF) TF_VAR_env=$(env) && \
	terraform destroy -chdir=../../layers/$(layer)/
	