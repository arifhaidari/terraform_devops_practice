output "ebs_id" {
  value = aws_ebs_volume.ebs_volume.id
}

output "ebs_az" {
  value = aws_ebs_volume.ebs_volume.availability_zone
}