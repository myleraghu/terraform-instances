# Base Platform Infrastructure
This is used to stand up base platform resources and serves as a template for new accounts

## Prerequisites
- Terraform 0.11.8
- AWS CLI Profile configured

## Getting Started
To get started developing in terraform, run the following command to set up your terraform environment

### Set Up
```sh
terraform init -backend-config="bucket=edgenuity-tf-state" -backend-config="key=<account>-platform-<environment>/terraform.tfstate" -backend-config="region=us-east-2" -backend-config="dynamodb_table=corp-tools-tf-state-lock"
```
