# provider block
provider "aws"{

  region = "us-east-2"
  }

#VPC
  resource "aws_vpc" "app_study_vpc"{
    cidr_block = var.vpc_cidr
     
tags = {
  Name = var.vpc_name
}
  }

#Subnet
  resource "aws_subnet" "app_study_subnet"{
    vpc_id = aws_vpc.app_study_vpc.id 
    cidr_block = var.subnet_cidr
     
tags = {
  Name = var.subnet_name
}
  }
 

#IGW
  resource "aws_internet_gateway" "app_study_IGW"{
    vpc_id = aws_vpc.app_study_vpc.id 
     
tags = {
  Name = var.igw_name
}
  }
 


#Route table
  resource "aws_route_table" "app_study_route"{
    vpc_id = aws_vpc.app_study_vpc.id 
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_study_IGW.id
}
     
tags = {
  Name = var.igw_name
}
  }

#associate Route table with subnet
  resource "aws_route_table_association" "rt_associate"{
    subnet_id = aws_subnet.app_study_subnet.id
    route_table_id = aws_route_table.app_study_route.id
  }

## Create new security group

resource "aws_security_group" "app_study_sg"{
    
    vpc_id = aws_vpc.app_study_vpc.id

ingress{
    description = "HTTP"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

}
ingree{
    description = "SSH"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    
egress{
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

#Create EC2 instance
resource "aws_instance" "app_study_instance"{
    ami      = var.ec2_ami
    instance_type = "t3.micro"

    subnet_id = aws_subnet.app_study_subnet.id
    vpc_security_group_ids = [aws_security_group.app_study_sg.id]

    associate_public_ip_address = true

    user_data = <<-EOF
    #!/bin/bash -ex

    amazon-linux-extras install nginx1 -y
    amazon-linux-extras install git -y
    echo <h1> "This is my new server </h1>" > /usr/share/nginx/html/index.html
    systemctl enable nginx
    systemctl start nginx
    EOF
    key_name = aws_key_pair.kp.key_name # newly added

tags = {
    "Name" = var.ec2_name
}
}
