resource "aws_key_pair" "mykey" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-0e86e20dae9224db8"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet-id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security-group-id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip-publico.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo subnet-id: ${data.terraform_remote_state.vpc.outputs.subnet-id} >> /tmp/network_info.txt",
      "echo security-group-id: ${data.terraform_remote_state.vpc.outputs.security-group-id} >> /tmp/network_info.txt",
    ]
  }

  provisioner "file" {
    source      = "./teste.txt"
    destination = "/tmp/exemplo-teste.txt"
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/ami.txt"
  }

  tags = {
    Name       = "Minha EC2"
    owner      = "carol"
    managed_by = "terraform"
  }
}
 