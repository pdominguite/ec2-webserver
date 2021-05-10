resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt install -y apache2
    a2enmod ssl
    a2ensite default-ssl
    systemctl start apache2
    systemctl enable apache2
    echo "<h1>Oh, hey you :D</h1>" > /var/www/html/index.html
    systemctl restart apache2.service
  EOF

  security_groups = [
    "${aws_security_group.allow_http.name}"
  ]

  tags = {
    Name = "${var.service_name}-${var.service_environment}"
    service = "${var.service_name}"
    environment = "${var.service_environment}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
