resource "aws_security_group" "devops-sg" {
  name = var.security_group

    dynamic "ingress" {
      for_each = var.security_group_ports
      content {
        protocol = "tcp"
       from_port = ingress.value
       to_port = ingress.value
       cidr_blocks = ["0.0.0.0/0"]
      }
    }
}
