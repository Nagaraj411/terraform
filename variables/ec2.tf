# This script will run instance & security Group inbound rules & ourbound rules 
resource "aws_instance" "roboshop" {
  ami           = var.ami_id  # left & right side no need to same right side we can change (left side is syntax to need to change)
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags = var.ec2_tags
}
resource "aws_security_group" "allow_all" {
    name        = "allow_all (New)"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow-all (New)"
    }
}