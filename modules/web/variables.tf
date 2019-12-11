variable "instance_count" {
  type = "string"
}

variable "ami_id" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

variable "key_pair_name" {
  type = "string"
}

variable "subnet_ids" {
  type = "list"
}

variable "security_group" {
  type = "list"
}

variable "application_id" {
  type = "string"
}

variable "scope_id" {
  type = "string"
}

variable "contact_name" {
  type = "string"
}

variable "contact_email" {
  type = "string"
}

#variable "web_number" {
#  type = "string"
#}

#variable "ou_path" {
#  type = "string"
#}

#variable "ad_password" {
#  type = "string"
#}

variable "app_level" {
   type = "string"
}

#variable "octopus_api" {
#  type = "string"
#}

variable "level" {
  type = "string"
}

variable "iam_profile" {
  type = "string"
  default = ""
}
