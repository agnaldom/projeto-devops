data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_vpc" {
    cidr_blocks                   = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support      = true

    tags {
        Name = "docker_swarm"
    }
}