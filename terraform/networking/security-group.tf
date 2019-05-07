resource "aws_security_group" "docker_swarm" {
    name = "sgdocker_swarm"
    vpc_id = "${aws_vpc.tf_vpc.id}"

    # Allow all inbound
    ingress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Enable ICMP
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

   ingress {
        # SSH
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        # Please restrict your ingress to only necessary IPs and ports.
        # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = {
        Name = "docker-swarm"
    }
}