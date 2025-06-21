resource "aws_instance" "roboshop" {
  # for_each = var.instances
  for_each = toset(var.instances) # for_each is used to create multiple resources based on a map or set.
   # list lone vunchali ante if want to use for_each ante (toset) laga convert cheyali use cheyali ot tomap ga aina use cheyali

  ami           = var.ami_id  # left & right side no need to same right side we can change (left side is syntax to need to change)
  # instance_type = each.value #  This [each.value] is a ec2 instance type like t3.micro & t3.small etc...
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags = {
    Name: each.key # This [each.key] is a instance name like mongodb, redis etc...
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