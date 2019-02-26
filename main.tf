# main.tf

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_jumpbox"
  description = "Allow SSH inbound traffic to Linux Jumpbox"
  vpc_id      = "${var.gc_dev_vpc_id}"

  ingress {
    # SSH 
    from_port = 22
    to_port   = 22

    # protocol    = "-1"
    protocol = "tcp"

    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.jumpbox_ssh_location}"
  }

  tags {
    Name = "Jumpbox-Linux-SG"
  }
}

resource "aws_instance" "jumpbox-linux" {
  ami                         = "${var.jumpbox_ami_id}"
  instance_type               = "${var.jumpbox_instance_type}"
  key_name                    = "${var.key_pair_name}"
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh.id}"]
  subnet_id                   = "${var.gc_dev_public_subnet}"
  associate_public_ip_address = "true"

  tags {
    Name = "Jumpbox-Linux"
  }
}

output "public_ip" {
  value = "${aws_instance.jumpbox-linux.public_ip}"
}
