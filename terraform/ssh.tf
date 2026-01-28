resource "tls_private_key" "my_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_id" "generated" {
  byte_length = 4
}

resource "aws_key_pair" "generated_key" {
  key_name   = "aws_ssh_key_${random_id.generated.hex}"
  public_key = tls_private_key.my_ssh_key.public_key_openssh
}

resource "local_sensitive_file" "pem_file" {
  filename        = pathexpand("~/.ssh/${aws_key_pair.generated_key.key_name}.pem")
  file_permission = "0600"
  content         = tls_private_key.my_ssh_key.private_key_pem
}