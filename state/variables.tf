variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = " RoboShop " # Captain N mainsion chestene Terraform main ani name vashudi
    Purpose = " Checking "
  }

}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_description" {
  default = "allowing all ports from internet"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow-all"
  }
}

variable "environment" {
  default = "dev" # if dev is using in ec2 instance is takes "t3.micro" other then that like prod it will take "t3.small"

}

variable "instances" {
  default = ["mongodb", "redis"] #, "redis", "mysql", "rabbitmq"]

}

variable "zone_id" {
  default = "Z05005862BAG0R5BQ5WUP"
}

variable "domain_name" {
  default = "devops84.shop"
}