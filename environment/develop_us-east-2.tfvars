region                      = "us-east-1"


corp_tools_account_s3 = "terraform-user"
instance_count=1
environment="dev"

corp_tools_account_s3_key   = "corp-tools/terraform.tfstate"

corp_tools_platform_s3_key  = "corp-tools-platform/terraform.tfstate"

account_s3_key              = "corp-tools/terraform.tfstate"


# Tagging

scope_id                    = "ID"

application_id              = "LMS"

key_pair_name               =  "demo-key"

contact_email               = "cloudengineering@edgenuity.com"

contact_name = "cloudengineering"

#ubuntu_ami_id = "ami-04b9e92b5572fa0d1"

ami_id = "ami-0c322300a1dd5dc79"

#windows_ami_id="ami-03fbd9bcb97e9cabb"