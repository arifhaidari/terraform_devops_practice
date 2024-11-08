data "aws_ami" "ubuntu" {
  most_recent = true 
  owners = [ "099720109477" ]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}



resource "aws_instance" "devops" {
  ami = data.aws_ami.ubuntu.id
  key_name = var.key_name
  availability_zone = var.az
  instance_type = var.instance_type
  security_groups = ["${var.security_group}" ]
#   user_data = file("../../script/k3s.sh")
  root_block_device {
    volume_size = 15
    volume_type = "gp2"
    encrypted = true 
    delete_on_termination = true
  }
  connection {
    host = self.public_ip 
    user = "ubuntu"
    private_key = file("./script/${var.key_name}.pem")
    type = "ssh"
  }
  provisioner "file" {
    source = "./script/k3s.sh"
    destination = "/tmp/k3s.sh"
  }
  provisioner "remote-exec" {
    inline = [  
      "chmod +x /tmp/k3s.sh",
      "sudo bash /tmp/k3s.sh"
     ]
    }
  provisioner "local-exec" {
    command = "echo Your Public IP address: ${self.public_ip} >> ip.txt"
  }
  tags = {
    Name = var.instance_name
  }
}

