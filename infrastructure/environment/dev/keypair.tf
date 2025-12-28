# Generate private key locally
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "github-actions-key"
  public_key = tls_private_key.ec2_key.public_key_openssh

  lifecycle {
    # Create a new key before destroying the old one
    create_before_destroy = true

    # Allow Terraform to destroy this resource if needed
    prevent_destroy = false
  }
}
