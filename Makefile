# Makefile for managing OpenTofu (Terraform) and Kubernetes tasks

# Variables
AWS_PROFILE ?= default

# Targets
.PHONY: all clean aws-config terraform-init terraform-apply kubectl-wait port-forward terraform-destroy

all: clean aws-config terraform-init terraform-apply kubectl-wait port-forward

clean:
	@echo "Cleaning up Terraform cache and state files..."
	rm -rf .terraform*
	rm -rf terraform.tfstate*

aws-config:
	@echo "Configuring AWS CLI with profile $(AWS_PROFILE)..."
	aws configure --profile $(AWS_PROFILE)

terraform-init:
	@echo "Initializing Terraform..."
	tofu init
	@if [ $$? -ne 0 ]; then \
	    echo "Terraform initialization failed. Exiting."; \
	    exit 1; \
	fi

terraform-apply: terraform-init
	@echo "Applying Terraform configuration..."
	tofu apply --auto-approve
	@if [ $$? -ne 0 ]; then \
	    echo "Terraform apply failed. Exiting."; \
	    exit 1; \
	fi

kubectl-wait:
	@echo "Waiting for Kubernetes service to be ready..."
	kubectl wait --for=condition=available --timeout=60s svc/frontend-proxy

port-forward:
	@echo "Setting up port forwarding on port 8080..."
	kubectl port-forward svc/frontend-proxy 8080:8080

terraform-destroy:
	@echo "Destroying Terraform-managed infrastructure..."
	tofu destroy --auto-approve
	@if [ $$? -ne 0 ]; then \
	    echo "Terraform destroy failed. Exiting."; \
	    exit 1; \
	fi