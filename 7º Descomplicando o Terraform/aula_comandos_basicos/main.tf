data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_subnet" "default" {
  vpc_id                  = "vpc-0cd134e0fa01daada" # ID da VPC padrão
  cidr_block              = "172.31.1.0/24" # Bloco CIDR ajustado para ser válido
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet"
  }
}
