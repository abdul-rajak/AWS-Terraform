onfiguration
provider "aws" {
  region = "us-west-2"
}

# Step 1: Create or Import Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArV5Nfklg+z....your public key...."
}

# Step 2: Create Security Group
resource "aws_security_group" "web_sg" {
  vpc_id = "your-vpc-id"  # Replace with your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

# Step 3: Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your preferred AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  subnet_id     = "your-subnet-id"  # Replace with your Subnet ID

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-instance"
  }
}

# Outputs
output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "public_dns" {
  value = aws_instance.web.public_dns
}

provider "aws" {
  region = "us-west-2"
}

# Step 1: Create or Import Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArV5Nfklg+z....your public key...."
}

# Step 2: Create Security Group
resource "aws_security_group" "web_sg" {
  vpc_id = "your-vpc-id"  # Replace with your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

# Step 3: Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your preferred AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  subnet_id     = "your-subnet-id"  # Replace with your Subnet ID

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-instance"
  }
}

# Outputs
output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "public_dns" {
  value = aws_instance.web.public_dns
}

