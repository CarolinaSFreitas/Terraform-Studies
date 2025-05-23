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

  owners = ["099720109477"] #Canonical
}

resource "aws_subnet" "default" {
  vpc_id                  = "vpc-0cd134e0fa01daada" 
  cidr_block              = "172.31.1.0/24" 
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet"
  }
}

resource "aws_instance" "web" {
  ami       = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
    Env = "Development"
  }
}