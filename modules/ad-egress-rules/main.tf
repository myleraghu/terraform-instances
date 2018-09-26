resource "aws_security_group_rule" "ad_egress_rule_01" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "egress"
  from_port                = 53
  to_port                  = 53
  protocol                 = "tcp"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.ad_egress_sg}"
}

resource "aws_security_group_rule" "ad_egress_rule_02" {
  count                    = "${length(var.source_security_group_ids)}"
  type                     = "egress"
  from_port                = 49152
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = "${element(var.source_security_group_ids, count.index)}"
  security_group_id        = "${var.ad_egress_sg}"
}
