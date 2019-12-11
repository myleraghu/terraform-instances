output "instance_ids" {
  value = "${aws_instance.web_srv.*.id}"
}
