resource "aws_security_group_rule" "bastion_server_rule_01" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "ingress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.bastion_sg_id}"
}

resource "aws_security_group_rule" "bastion_server_rule_02" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "egress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.bastion_sg_id}"
}
