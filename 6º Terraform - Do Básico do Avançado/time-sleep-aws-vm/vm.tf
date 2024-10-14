resource "aws_key_pair" "mykey" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm_01" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet-id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security-group-id]

  tags = {
    Name       = "Minha EC2 - 01"
    owner      = "carol"
    managed_by = "terraform"
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_instance.vm_01]

  create_duration  = "30s"
  destroy_duration = "30s"
}

resource "aws_instance" "vm_02" {
  depends_on = [time_sleep.wait_30_seconds]

  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet-id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security-group-id]

  tags = {
    Name       = "Minha EC2 - 02"
    owner      = "carol"
    managed_by = "terraform"
  }
}
