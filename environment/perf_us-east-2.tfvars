region = "us-east-2"

environment = "perf"

# Automation User Role Arn
assume_role_arn = "arn:aws:iam::<account_id>:role/AutomationUserRole"

# Remote States
corp_tools_s3 = "edgenuity-tf-state"

corp_tools_account_s3_key = "corp-tools/terraform.tfstate"

corp_tools_platform_s3_key = "corp-tools-platform/terraform.tfstate"

account_s3_key = "<account>-<environment>/terraform.tfstate"
