resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform-udemy"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform-udemy"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw-terraform-udemy"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table-terraform-udemy"
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "security-group-terraform-udemy"
  description = "Permitir acesso na porta 22"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ports

    content {
      description = ingress.value.description # value é o valor do map
      from_port   = ingress.key               # key é o valor da chave do map
      to_port     = ingress.key               # key é o valor da chave do map
      protocol    = "tcp"                     # pode definir coisas estáticas
      cidr_blocks = ingress.value.cidr_blocks # value é o valor do map
      # cidr_blocks = ingress.value["cidr_blocks"] # tbm pode ser acessado assim
    }
  }

  egress {
    description = "All traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #"-1" permite todos os protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-terraform-udemy"
  }
}

