# resource "aws_subnet" "public_a" {
#   availability_zone = "${var.region}a"
#   # cidr_block        = "${lookup(var.subnet_public_a_cidr, "${terraform.workspace}", var.subnet_public_a_cidr["default"])}"
#   vpc_id            = "${var.vpc_id}"
# }
# resource "aws_subnet" "public_c" {
#   availability_zone = "${var.region}c"
#   cidr_block        = "${var.subnet_public_c_cidr}"
#   vpc_id            = "${var.vpc_id}"
# }
