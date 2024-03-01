locals {
  vpc_name_local = "${var.vpc_name}-lab"
  web_server     = "${var.web_server_name}-lab"
  bastion_host   = "${var.vpc_name}-bastion-host-lab"
}