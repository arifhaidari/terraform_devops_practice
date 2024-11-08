module "ec2" {
  source = "./modules/ec2"
  az =  module.ebs.ebs_az
  key_name =  var.key_name
  security_group =  module.sg.security_group_name
  instance_name =  var.instance_name
  instance_type =  var.instance_type
  volume_size = var.volume_size
}

module "sg" {
  source = "./modules/sg"
  security_group = var.security_group
  security_group_ports = var.security_group_ports
}

module "keypair" {
  source = "./modules/keypair"
  key_name = var.key_name
}
module "ebs" {
  source = "./modules/ebs"
  az =  var.az
  volume_size =  var.volume_size
  ebs_name = var.ebs_name
}

resource "aws_volume_attachment" "name" {
    volume_id =  module.ebs.ebs_id
    instance_id = module.ec2.instance_id
    device_name = "/dev/sdh"
  
}