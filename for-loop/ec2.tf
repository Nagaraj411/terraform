# This script will run instance & security Group inbound rules & ourbound rules 
resource "aws_instance" "roboshop" {
  for_each = var.instances
  count = 4     # This count = 4 line will create 4 instances at a time using loop concepts
  ami           = var.ami_id  # left & right side no need to same right side we can change (left side is syntax to need to change)
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" # this is the syntax of condition
  # line 4 command dev is ture it take "t3.micro" & its false it take "t3.small" 
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags = {
    Name: var.instances[count.index] # This [count.index] will create the instance with diffent name like mongodb, redis etc...
  }
}
resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}