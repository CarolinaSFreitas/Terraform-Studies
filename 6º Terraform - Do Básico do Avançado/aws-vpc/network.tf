resource "aws_security_group" "security_group" {
  name        = "security-group-terraform-udemy"
  description = "Permitir acesso na porta 22"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # boa prática de segurança é fzr hardcoded os IPs que podem acessar
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
