# Generate a new private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair using the generated public key
resource "aws_key_pair" "ec2_key" {
  key_name   = "lt-ec2-keypair"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
  content          = tls_private_key.ec2_key.private_key_pem
  filename         = "${path.module}/lt-ec2-keypair.pem"
  file_permission  = "0400"
}
