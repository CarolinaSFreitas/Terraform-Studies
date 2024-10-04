resource "aws_key_pair" "mykey" {
  key_name   = "aws-key-${var.environment}"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name
  subnet_id                   = module.network.subnet-id
  vpc_security_group_ids      = [module.network.security-group-id]

  tags = {
    Name       = "vm-${var.environment}"
    owner      = "carol"
    managed_by = "terraform"

  }
}
 