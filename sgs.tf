module "bastion_connect" {
  source = "./modules/bastion-sg-rules"

  source_security_group_ids = [
    "${var.environment == "prod" ? data.terraform_remote_state.corp_tools_platform.bastion_prod_sg : data.terraform_remote_state.corp_tools_platform.bastion_dev_sg}"
  ]

  bastion_sg_id = "${data.terraform_remote_state.account.bastion_sg}"
}

module "wsus_connect" {
  source = "./modules/wsus-sg-rules"

  source_security_group_ids = [
    "${data.terraform_remote_state.corp_tools_platform.wsus_server_sg}"
  ]

  wsus_sg_id = "${data.terraform_remote_state.account.wsus_sg}"
}

module "ad_connect" {
  source = "./modules/ad-egress-rules"

  source_security_group_ids = [
    "${data.terraform_remote_state.corp_tools_platform.ad_egress_sg}"
  ]

  ad_egress_sg = "${data.terraform_remote_state.account.ad_sg}"
}

module "opsworks_connect" {
  source = "./modules/opsworks-sg-rules"

  source_security_group_ids = [
    "${data.terraform_remote_state.corp_tools_platform.chef_server_sg}"
  ]

  opsworks_sg_id = "${data.terraform_remote_state.account.chef_sg}"
}
