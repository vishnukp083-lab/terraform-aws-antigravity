resource "random_id" "key_suffix" {
  byte_length = 4
}

resource "tls_private_key" "github_key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "github-actions-key-${random_id.key_suffix.hex}"
  public_key = tls_private_key.github_key.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.github_key.private_key_pem
  sensitive = true
}


