variable "environment" {
  type = "string"
}

variable "region" {
  type = "string"
}

#variable "assume_role_arn" {
#  type = "string"
#}

variable "corp_tools_account_s3" {
  type = "string"
}

variable "corp_tools_account_s3_key" {
  type = "string"
}

variable "corp_tools_platform_s3_key" {
  type = "string"
}

variable "account_s3_key" {
  type = "string"
}

# Tagging
variable "scope_id" {
  type = "string"
}

variable "application_id" {
  type = "string"
}

variable "contact_name" {
  type = "string"
}

variable "contact_email" {
  type = "string"
}


variable "ami_id" {
  type = "string"
}

variable "instance_type" {
  type = "string"
  default="t2.micro"
}

variable "key_pair_name" {
  type = "string"
}


variable "instance_count" {
  type = "string"
}

#variable "web_number" {
#	type = "string"
#}