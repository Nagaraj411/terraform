variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "component" {
  default = "cart"
}

variable "common_tags" {
  default = {
    Project   = "roboshop"
    Terraform = "true"
  }
}



# ec2 name = cart
# ec2 name = roboshop-dev-cart (this is the good to find the path of cart)