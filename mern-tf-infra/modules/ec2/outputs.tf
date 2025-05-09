output "instance_id" {
  value = aws_instance.mern_ec2.id
}
output "ec2_key_name" {
  value = aws_key_pair.ec2_key.key_name
}
