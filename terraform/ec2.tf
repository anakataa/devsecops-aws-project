data "aws_ami" "ubuntu_22_04" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "devsecops_ec2" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = "t3.micro"
  key_name      = "devsecops-key"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.devsecops_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "devsecops-ec2"
  }
}

# Bastion host (public)
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = "t3.micro"
  key_name      = "devsecops-key"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }
}

# App server (private)
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = "t3.micro"
  key_name      = "devsecops-key"

  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "app-server"
  }
}
