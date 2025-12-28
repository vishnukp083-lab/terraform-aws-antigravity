# Generate a unique suffix to avoid duplicate key names
resource "random_id" "key_suffix" {
  byte_length = 4
}

# Generate a new SSH key pair locally
resource "tls_private_key" "github_key" {
  algorithm = "ED25519"
}

# Delete existing key pair if exists
data "aws_key_pair" "existing_key" {
  key_name = "github-actions-key-${random_id.key_suffix.hex}"
  # If it doesn't exist, Terraform will continue
  # We will ignore errors in this data source using lifecycle
  lifecycle {
    ignore_errors = true
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = "github-actions-key-${random_id.key_suffix.hex}"
  public_key = tls_private_key.github_key.public_key_openssh

  lifecycle {
    prevent_destroy = false
  }
}

# Output private key for GitHub Actions
output "private_key_pem" {
  value     = tls_private_key.github_key.private_key_pem
  sensitive = true
}

# Output key name
output "key_name" {
  value = aws_key_pair.generated_key.key_name
}
