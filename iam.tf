resource "aws_iam_role" "chef_automate_node_role" {
  name = "aws-opsworks-cm-node-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "chef_automate_node_instance_profile" {
  name = "aws-opsworks-cm-node-instance-profile"
  role = "${aws_iam_role.chef_automate_node_role.name}"
}

data "aws_iam_policy_document" "assume_external_role" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      "${data.terraform_remote_state.corp_tools_account.chef_automate_subaccount_role_arn}"
    ]
  }
}

resource "aws_iam_policy" "chef_automate_node_policy" {
  name   = "chef-automate-node-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_external_role.json}"
}

resource "aws_iam_role_policy_attachment" "account_opswork_role_attach" {
  role       = "${aws_iam_role.chef_automate_node_role.name}"
  policy_arn = "${aws_iam_policy.chef_automate_node_policy.arn}"
}
