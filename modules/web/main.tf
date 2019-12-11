resource "aws_instance" "web_srv" {
  count                = "${var.instance_count}"
  ami                  = "${var.ami_id}"
  #web_number    = ""
  instance_type        = "${var.instance_type}"
  #iam_instance_profile = "${var.iam_profile}"
  key_name             = "${var.key_pair_name}"
  subnet_id            = "${element(var.subnet_ids, count.index)}"

  vpc_security_group_ids = ["${var.security_group}"]

  root_block_device {
    volume_size = 100
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags {
    Platform        = "${var.application_id}"
    Environment     = "${var.scope_id}"
    Contact         = "${var.contact_name}"
    "Contact Email" = "${var.contact_email}"
    #"Server Name"   = "B0${var.web_number}-${var.app_level}-WEB0${count.index + 1}"
   # Name            = "${title(lower(var.level))} ${var.web_number} - WEB-SRV server ${count.index + 1}"
  }

#  user_data         = "${element(data.template_file.bootstrap_script_web.*.rendered, count.index)}"
#  lifecycle {
#    ignore_changes = ["user_data"]
#  }

}

#data "template_file" "bootstrap_script_web" {
#  template = "${file("./scripts/userdata.tpl")}"
#  count    = "${var.instance_count}"

#  vars {
#    ad_password = "${var.ad_password}"
#    node_name   = "B0${var.nwea_number}-${var.app_level}-WEB0${count.index + 1}"
#    ou_path     = "${var.ou_path}"
#    octopus_api = "${var.octopus_api}"
#  }
#}
