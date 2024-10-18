resource "aws_key_pair" "key" {
  key_name   = "mykey"
  public_key = var.aws_key_pub
}

resource "aws_instance" "vm" {
  ami                         = "ami-0866a3c8686eaeeba"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet-id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security-group-id]
  associate_public_ip_address = true


  tags = {
    Name = "VM Terraform"
  }
}