# NWEA Service server
module "web" {
  source = "./modules/web"

  level          = "TEST SRV"
  app_level      = "TEST SRV"
  instance_count = "${var.instance_count}"
  ami_id     = "${var.ami_id}"
  instance_type  = "${var.instance_type}"
  #iam_profile    = "${aws_iam_instance_profile.nweasrv_profile.id}"
  key_pair_name = "${var.key_pair_name}"
  subnet_ids     = "${data.terraform_remote_state.account.public_subnet_ids}"

  security_group = [
    "${aws_security_group.rdpssh.id}",
    "${aws_security_group.http_https.id}",
    "${aws_security_group.web_sg.id}",
  ]

#  ou_path        = "OU=Dev CI Realm01,OU=DevCIRealms,OU=Dev CI,OU=Universe,OU=Dev,DC=education2020,DC=com"
#  ad_password    = ""
#  octopus_api    = ""

  #tagging
  scope_id       = "${var.scope_id}"
  application_id = "${var.application_id}"
  contact_name   = "${var.contact_name}"
  contact_email  = "${var.contact_email}"

}

#Module RDS-MSSQL
#module "NWEA_rds_mssql" {
#  source = "./modules/mssql"
 
#  identifier = "${var.identifier}"
#  engine            = "${var.database_engine}"
#  engine_version    = "${var.database_engine_version}"
#  instance_class    = "${var.database_instance_class}"
#  allocated_storage = "${var.database_storage_allocated}"
#   name     =  "${var.database_name}"
#  username = "${var.database_username}"
#  password = "${var.database_password}"
#  port     = "${var.database_port}"
#  vpc_security_group_ids = [
#  	"${aws_security_group.mssql.id}"]
  	
#  #db_security_group =	"${aws_security_group.mssql}"
 
#  db_subnet_ids= "${data.terraform_remote_state.account.database_subnet_ids}"
  
  #tagging
#  level          = "realm"
#  realm_number   = "1"
#  app_level      = "RCI"
#  scope_id       = "${var.scope_id}"
#  application_id = "${var.application_id}"
#  contact_name   = "${var.contact_name}"
#  contact_email  = "${var.contact_email}"
#}