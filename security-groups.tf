#General RDP/SSH access security group from on-premise network
resource "aws_security_group" "rdpssh" {
  name        = "${var.application_id}RDPSSH"
  description = "Security Group to allow RDP/SSH access from on-premise"
  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

  tags {
  Platform        = "${var.application_id}"
  Environment     = "${var.scope_id}"
  Contact         = "${var.contact_name}"
  "Contact Email" = "${var.contact_email}"
  Name            = "RDP/SSH Security Group"
  }
}

resource "aws_security_group_rule" "rdpssh_ingress_01" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = [
    "10.130.0.0/16",
    "10.10.0.0/16",
    "10.201.0.0/16",
    "192.168.0.0/16",
    "10.32.0.0/16",
  ]
  security_group_id = "${aws_security_group.rdpssh.id}"
}

resource "aws_security_group_rule" "rdpssh_ingress_02" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [
    "10.130.0.0/16",
    "10.10.0.0/16",
    "10.201.0.0/16",
    "192.168.0.0/16",
    "10.32.0.0/16",
  ]
  security_group_id = "${aws_security_group.rdpssh.id}"
}

resource "aws_security_group_rule" "rdpssh_egress_01" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.rdpssh.id}"
}

#MongoDB Security Group
#resource "aws_security_group" "mongodb" {
#  name        = "${var.application_id}_mongodb_sg"
#  description = "Security Group for Mongo to allow access on port 27017"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "MongoDB Security Group"
#  }
#}

#resource "aws_security_group_rule" "mongodb_ingress_01" {
#  type              = "ingress"
#  from_port         = 27017
#  to_port           = 27017
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.130.0.0/16",
#    "10.10.0.0/16",
#    "10.201.0.0/16",
#    "192.168.0.0/16",
#    "10.32.0.0/16",
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.mongodb.id}"
#}

#MSSQL Security Group
#resource "aws_security_group" "mssql" {
#  name        = "${var.application_id}_mssql_sg"
#  description = "Security Group for MSSQL to allow access on port 1433"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "MSSQL Security Group"
#  }
#}

#resource "aws_security_group_rule" "mssql_ingress_01" {
#  type              = "ingress"
#  from_port         = 1433
#  to_port           = 1433
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.130.0.0/16",
#    "10.10.0.0/16",
#    "10.201.0.0/16",
#    "192.168.0.0/16",
#    "10.32.0.0/16",
#    "10.174.0.0/20",
#   ]
#  security_group_id = "${aws_security_group.mssql.id}"
#}

#Redis Security group
#resource "aws_security_group" "redis" {
#  name        = "${var.application_id}_redis_sg"
#  description = "Security Group for Redis to allow access on port 6379"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "Redis Security Group"
#  }
#}

#resource "aws_security_group_rule" "redis_ingress_01" {
#  type              = "ingress"
#  from_port         = 6379
#  to_port           = 6379
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.130.0.0/16",
#    "10.10.0.0/16",
#    "10.201.0.0/16",
#    "192.168.0.0/16",
#    "10.32.0.0/16",
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.redis.id}"
#}

#resource "aws_security_group_rule" "redis_ingress_02" {
#  type              = "ingress"
#  from_port         = 16379
#  to_port           = 16379
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.redis.id}"
#}

#Web Traffic Security Group
resource "aws_security_group" "http_https" {
  name        = "${var.application_id}_http_https_sg"
  description = "Security Group for traffic on port 80 and 443"
  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

  tags {
  Platform        = "${var.application_id}"
  Environment     = "${var.scope_id}"
  Contact         = "${var.contact_name}"
  "Contact Email" = "${var.contact_email}"
  Name            = "HTTP and HTTPS Security Group"
  }
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [
    "10.130.0.0/16",
    "10.10.0.0/16",
    "10.201.0.0/16",
    "192.168.0.0/16",
    "10.32.0.0/16",
    "10.174.0.0/20",
  ]
  security_group_id = "${aws_security_group.http_https.id}"
}

resource "aws_security_group_rule" "https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [
    "10.130.0.0/16",
    "10.10.0.0/16",
    "10.201.0.0/16",
    "192.168.0.0/16",
    "10.32.0.0/16",
    "10.174.0.0/20",
  ]
  security_group_id = "${aws_security_group.http_https.id}"
}

#Loadbalancer Traffic Security Group
#resource "aws_security_group" "alb_sg" {
#  name        = "${var.application_id}_alb_sg"
#  description = "Load Balancer Security Group for traffic on port 80 and 443"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "Loadbalancer Security Group"
#  }
#}

#resource "aws_security_group_rule" "alb_http_ingress" {
#  type              = "ingress"
#  from_port         = 80
#  to_port           = 80
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.130.0.0/16",
#    "10.10.0.0/16",
#    "10.201.0.0/16",
#    "192.168.0.0/16",
#    "10.32.0.0/16",
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.alb_sg.id}"
#}

#resource "aws_security_group_rule" "alb_https_ingress" {
#  type              = "ingress"
#  from_port         = 443
#  to_port           = 443
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.130.0.0/16",
#    "10.10.0.0/16",
#    "10.201.0.0/16",
#    "192.168.0.0/16",
#    "10.32.0.0/16",
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.alb_sg.id}"
#}

#resource "aws_security_group_rule" "alb_http_egress" {
#  type              = "egress"
#  from_port         = 80
#  to_port           = 80
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = "${aws_security_group.alb_sg.id}"
#}

#resource "aws_security_group_rule" "alb_https_egress" {
#  type              = "egress"
#  from_port         = 443
#  to_port           = 443
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = "${aws_security_group.alb_sg.id}"
#}

#Web Server Security Group
resource "aws_security_group" "web_sg" {
  name        = "${var.application_id}_web_sg"
  description = "Security Group for web servers"
  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

  tags {
  Platform        = "${var.application_id}"
  Environment     = "${var.scope_id}"
  Contact         = "${var.contact_name}"
  "Contact Email" = "${var.contact_email}"
  Name            = "Web Servers Security Group"
  }
}

resource "aws_security_group_rule" "web_ingress_01" {
  type              = "ingress"
  from_port         = 10933
  to_port           = 10933
  protocol          = "tcp"
  cidr_blocks       = [
    "10.201.0.0/16",
  ]
  security_group_id = "${aws_security_group.web_sg.id}"
}

#Task Server Security Group
#resource "aws_security_group" "task_sg" {
#  name        = "${var.application_id}_task_sg"
#  description = "Security Group for Task servers"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "Task Servers Security Group"
#  }
#}

#resource "aws_security_group_rule" "task_ingress_01" {
#  type              = "ingress"
#  from_port         = 10933
#  to_port           = 10933
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.201.0.0/16",
#  ]
#  security_group_id = "${aws_security_group.task_sg.id}"
#}

#resource "aws_security_group_rule" "task_ingress_02" {
#  type              = "ingress"
#  from_port         = 9623
#  to_port           = 9625
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.task_sg.id}"
#}

#resource "aws_security_group_rule" "task_ingress_03" {
#  type              = "ingress"
#  from_port         = 81
#  to_port           = 81
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.174.0.0/20",
#  ]
#  security_group_id = "${aws_security_group.task_sg.id}"
#}

#Tools Server Security Group
#resource "aws_security_group" "tools_sg" {
#  name        = "${var.application_id}_tools_sg"
#  description = "Security Group for Tools servers"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "Tools Servers Security Group"
#  }
#}

#resource "aws_security_group_rule" "tools_ingress_01" {
#  type              = "ingress"
#  from_port         = 10933
#  to_port           = 10933
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "10.201.0.0/16",
#  ]
#  security_group_id = "${aws_security_group.tools_sg.id}"
#}

#File Share Window Server Security Group
#resource "aws_security_group" "fsw_sg" {
#  name        = "${var.application_id}_fsw_sg"
#  description = "Security Group for File Share window servers"
#  vpc_id      = "${data.terraform_remote_state.account.vpc_id}"

#  tags {
#  Platform        = "${var.application_id}"
#  Environment     = "${var.scope_id}"
#  Contact         = "${var.contact_name}"
#  "Contact Email" = "${var.contact_email}"
#  Name            = "File Share Window Servers Security Group"
#  }
#}

#resource "aws_security_group_rule" "fsw_ingress_01" {
#  type              = "ingress"
#  from_port         = 445
#  to_port           = 445
#  protocol          = "tcp"
#  cidr_blocks       = [
#    "${data.terraform_remote_state.account.vpc_cidr}",
#  ]
#  security_group_id = "${aws_security_group.fsw_sg.id}"
#}
