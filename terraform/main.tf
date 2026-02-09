resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support =  true
  tags = {
    Name = "8byte-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id =  aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "8byte-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, { Name = "${var.environment_name}-igw" })
}

resource "aws_route_table" "public_rt" {
  vpc_id =  aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.tags, { Name = "${var.environment_name}-public-rt"})
 
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id = aws_subnet.public.id 
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "app_sg" {
  name = "app-sg"
  description = "Allow SSH and app access"
  vpc_id = aws_vpc.main.id

  ingress{
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description =  "App on port 3000"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "app-sg"
  }
 

}

resource "aws_instance" "app_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app_sg.id] 
  associate_public_ip_address = true 

  user_data     = <<-EOF
                     #!/bin/bash
  apt-get update -y
  apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  curl -fsSL https://get.docker.com | bash

  systemctl enable docker
  systemctl start docker
  usermod -aG docker ubuntu
                  EOF

    tags = {
      Name = "docker-server"
    }

}