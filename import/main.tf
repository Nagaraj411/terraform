resource "aws_instance" "linux" {

  ami                    = "ami-09c813fb71547fc4f"
  subnet_id              = "subnet-0c7582a9ab3fb0fd1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0d9c60a601a05386b"]

  tags_all = {
    Name = "linux"
  }

}