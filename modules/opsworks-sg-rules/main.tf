resource "aws_security_group_rule" "opsworks_rule_01" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.opsworks_sg_id}"
}

resource "aws_security_group_rule" "opsworks_rule_02" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.opsworks_sg_id}"
}
